package com.cn.great.controller;

import com.cn.great.enums.OnlineEnum;
import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ErrorResponse;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.online.LoginInfoEntity;
import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.user.PayPasswordReq;
import com.cn.great.service.UserService;
import com.cn.great.util.DateUtils;
import com.cn.great.util.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * @program: sport
 * @description: 用户常规操作
 * @author: Stamp
 * @create: 2019-04-03 10:43
 **/
@RestController
@RequestMapping("/user")
@Slf4j
public class UserManageController {

    @Autowired
    private RedisUtil redisUtil;
    @Resource
    private UserService userService;

    @PostMapping(value = "/loginout", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity loginout(HttpServletRequest request) throws GeneralException {
        String userName = (String) request.getSession().getAttribute(Constant.USER_NAME_SESSION);
        log.info("【用户{}登出】", userName);
        //获取此用户登录信息
        LoginInfoEntity loginInfo = userService.getUserLoginInfo(userName);
        if (loginInfo == null) {
            log.error("<<<用户{}登出失败>>> 用户不存在......", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
        }
        loginInfo.setOnline(OnlineEnum.getCode("登出"));
        loginInfo.setLogoutTime(DateUtils.getDateTime());
        loginInfo.setToken("");
        userService.userLoginout(loginInfo);
        log.info("【用户{}登出成功】", userName);
        return ResponseEntity.initGeneralResponseMsg("登出成功");
    }


    /**
     * @Description: 修改提款密码
     * @Param: [payPasswordReq, request]
     * @return: com.cn.great.model.common.ErrorResponse
     * @Author: Stamp
     * @Date: 2019/4/4
     */
    @PostMapping(value = "/ChangePayPassword", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ErrorResponse changePayPassword(@RequestBody @Valid PayPasswordReq payPasswordReq, HttpServletRequest request) throws GeneralException {
        String userName = (String) request.getSession().getAttribute(Constant.USER_NAME_SESSION);
        log.info("【用户{}修改提款密码】", userName);
        MemberInfoEntity memberInfo = userService.getMemberInfo(userName);
        if (!StringUtils.equals(payPasswordReq.getPassword(), memberInfo.getWithdrawalPasswd())) {
            log.error("<<<用户{}修改提款密码失败>>> 原密码错误......", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.OLD_PASSWORD_ERROR);
        }
        //数据库修改会员提款密码
        memberInfo.setWithdrawalPasswd(payPasswordReq.getNewPassword());
        userService.updateMemberDrawPassword(memberInfo);
        redisUtil.set(userName + Constant.MEMBER_INFO_CACHE_SALT, memberInfo);
        log.info("【用户{}修改提款密码成功】", userName);
        return ErrorResponse.initNormalResponseEntity(ResponseCodeEnum.UPDATE_PASSWORD_ERROR);
    }

    /** 
    * @Description: 修改登录密码
    * @Param: [payPasswordReq, request] 
    * @return: com.cn.great.model.common.ErrorResponse 
    * @Author: Stamp 
    * @Date: 2019/4/4 
    */
    @PostMapping(value = "/ChangeLoginPassword", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ErrorResponse changeLoginPassword(@RequestBody @Valid PayPasswordReq payPasswordReq, HttpServletRequest request) throws GeneralException {
        String userName = (String) request.getSession().getAttribute(Constant.USER_NAME_SESSION);
        log.info("【用户{}修改登录密码】", userName);
        UserInfoEntity userInfo = userService.fetchUserInfo(userName);
        if (!StringUtils.equals(payPasswordReq.getPassword(), userInfo.getPassword())) {
            log.error("<<<用户{}修改登录密码失败>>> 原密码错误......", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.OLD_PASSWORD_ERROR);
        }
        //数据库修改会员登录密码
        userInfo.setPassword(payPasswordReq.getPassword());
        userService.updateUserPassword(userInfo);
        redisUtil.set(userName + Constant.USER_INFO_CACHE_SALT, userInfo);
        log.info("【用户{}修改登录密码成功】", userName);
        return ErrorResponse.initNormalResponseEntity(ResponseCodeEnum.UPDATE_PASSWORD_ERROR);
    }


}
