package com.cn.great.controller;


import com.alibaba.fastjson.JSONObject;
import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.online.LoginInfoEntity;
import com.cn.great.model.user.AgentInfoEntity;
import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.model.user.QuestionEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.user.LoginReq;
import com.cn.great.req.user.RegisterReq;
import com.cn.great.req.user.RorgetLoginPasswordReq;
import com.cn.great.service.UserService;
import com.cn.great.util.*;
import com.google.code.kaptcha.Constants;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

/**
 * @program: sport
 * @description: 用户注册和登录
 * @author: Stamp.M
 * @create: 2019-03-06 19:20
 **/
@RestController
@RequestMapping("/main")
@Slf4j
public class UserController {
    @Resource
    private UserService userService;


    /**
     * @Description: 用户登录
     * @Param: [loginReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    @PostMapping(value = "/login", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity login(@RequestBody @Valid LoginReq loginReq, HttpServletRequest request) throws GeneralException {

        String userName = loginReq.getUsername();
        String password = loginReq.getPassword();
        String ip = IPUtils.getRealIp(request, 0);
        String url = request.getServerName() + ":" + request.getServerPort();
        log.info("【用户{}登录】", userName);
        UserInfoEntity user = userService.fetchUserInfo(userName);
        if (user == null) {
            log.error("<<<用户{}登录失败>>> 用户不存在", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!StringUtils.equals(user.getPassword(), password)) {
            log.error("<<<用户{}登录失败>>> 密码错误......", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.PASSWORD_ERROR);
        }
        if (user.getStatus() != 0) {
            log.error("<<<用户{}登录失败>>> 账号被停用......", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ACCOUNT_DISABLE_ERROR);
        }
        //在保证没有跨域或者跨域了能保证sessionid一致的前提下，可以将登录用户名缓存在session
        request.getSession().setAttribute(Constant.USER_NAME_SESSION, userName);
        String token = TokenUtils.buildUUID();
        String accessToken = TokenUtils.getToken(userName, token);
        //数据库更新会员登录信息
        LoginInfoEntity loginInfo = CommonMethodUtils.buildLoginInfo(user, ip, url, token);
        userService.deleteUserLoginInfo(userName);
        userService.addUserLoginInfo(loginInfo);
        JSONObject json = new JSONObject();
        json.put("access-token", accessToken);
        json.put("username", userName);
        json.put("money", user.getMoney());
        log.info("【用户{}登录成功】", userName);
        return ResponseEntity.initGeneralResponseObj("登陆成功", json);
    }


    /**
     * @Description: 会员注册
     * @Param: [registerReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/4/2
     */
    @PostMapping(value = "/register", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity register(@RequestBody @Valid RegisterReq registerReq, HttpServletRequest request) throws GeneralException {

        String userName = registerReq.getUsername();
        String agents = registerReq.getAgents();
        String ip = IPUtils.getRealIp(request, 0);
        String url = request.getServerName() + ":" + request.getServerPort();
        log.info("【用户{}注册】", userName);
        if (checkUserExists(userName)) {
            log.error("<<<用户{}注册失败>>> 用户已经存在......", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ACCOUNT_EXISTS_ERROR);
        }
        String registerCaptcha = registerReq.getRegisterCaptcha();
        String capText = GeneralUtils.getStringValue(request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY));
//        String capText = getCaptchaText(userName);
        if (StringUtils.isBlank(capText) || !StringUtils.equalsIgnoreCase(registerCaptcha, capText)) {
            log.error("<<<用户{}注册失败>>> 验证码不正确......", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.VERIFY_CODE_ERROR);
        }
        Integer agentId = -1;
        if (StringUtils.isNotBlank(agents)) {
            agentId = checkAgentExists(agents);
            if (agentId == 0) {
                log.error("<<<用户{}注册失败>>> 代理账号不存在......", agents);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.AGENT_NOT_EXIST_ERROR);
            }
        }
        // 从Header获取 server_admin 总代理
        String serverAdmin = request.getHeader("SERVER_ADMIN");
        String token = TokenUtils.buildUUID();
        String accessToken = TokenUtils.getToken(userName, token);
        UserInfoEntity user = CommonMethodUtils.buildUserInfo(userName, agentId, registerReq.getPassword(), serverAdmin);
        userService.addUserInfo(user);
        UserInfoEntity userInfo = userService.fetchUserInfo(userName);
        Integer userId = userInfo.getId();
        MemberInfoEntity member = CommonMethodUtils.buildMemberInfo(registerReq, userId, ip);
        userService.addMemberInfo(member);
        //数据库更新会员登录信息
        LoginInfoEntity loginInfo = CommonMethodUtils.buildLoginInfo(user, ip, url, token);
        userService.deleteUserLoginInfo(userName);
        userService.addUserLoginInfo(loginInfo);
        //在保证没有跨域或者跨域了能保证sessionid一致的前提下，可以将登录用户名缓存在session
        request.getSession().setAttribute(Constant.USER_NAME_SESSION, userName);
        JSONObject json = new JSONObject();
        json.put("access-token", accessToken);
        json.put("username", userName);
        json.put("money", user.getMoney());
        log.info("【用户{}注册成功】", userName);
        return ResponseEntity.initGeneralResponseObj("注册成功", json);
    }


    /**
     * @Description: 保密问题字典
     * @Param: [request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/4/4
     */
    @PostMapping(value = "/question", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity question(HttpServletRequest request) throws GeneralException {
        log.info("获取所有保密问题字典......");
        List<QuestionEntity> questions = userService.fetchAllQuestions();
        return ResponseEntity.initGeneralResponseObj("密保问题字典", questions);
    }


    /**
     * @Description: 密码找回
     * @Param: [forgetPassword, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/4/4
     */
    @PostMapping(value = "/ForgetLoginPassword", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity forgetLoginPassword(@RequestBody @Valid RorgetLoginPasswordReq forgetPassword, HttpServletRequest request) throws GeneralException {
        String userName = forgetPassword.getUserName();
        log.info("用户{}登录密码找回", userName);
        MemberInfoEntity user = userService.getMemberInfo(userName);
        UserInfoEntity userInfo = userService.fetchUserInfo(userName);
        if (user == null)
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
        String newPassword = forgetPassword.getNewPassword();
        String type = forgetPassword.getType();
        Integer question = forgetPassword.getQuestion();
        String answer = forgetPassword.getAnswer();
        String password = forgetPassword.getPassword();
        if (StringUtils.isBlank(type)) {
            //置空->通过提款密码找回
            if (StringUtils.isBlank(password) || !StringUtils.equals(password, user.getWithdrawalPasswd())) {
                log.error("用户提款密码错误......");
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.DRAW_PASSWORD_ERROR);
            }
        } else {
            //1->通过密保找回
            if (!StringUtils.equals(type, "1") || question == null
                    || question != user.getQuestion()
                    || !StringUtils.equals(answer, user.getAnswer())) {
                log.error("用户密保问题错误......");
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ENCRYPT_QUESTION_ERROR);
            }
        }
        //修改登录密码
        userInfo.setPassword(newPassword);
        userService.updateUserPassword(userInfo);
        log.info("【用户{}修改登录密码成功】", userName);
        return ResponseEntity.initGeneralResponseMsg("修改密码成功");
    }

    /**
     * @Description: 验证用户名
     * @Param: [request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/4/4
     */
    @PostMapping(value = "/MemExist", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity memExist(@Param("username") String username, HttpServletRequest request) throws GeneralException {
        if (StringUtils.isBlank(username))
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.FIELD_NOT_STANDARD_ERROR);
        boolean res = checkUserExists(username);
        if (res) {
            log.error("会员账号已经存在......");
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ACCOUNT_EXISTS_ERROR);
        }
        return ResponseEntity.initGeneralResponseMsg("账号可用");
    }
    private boolean checkUserExists(String userName) {
        // 从缓存中获取会员信息
        UserInfoEntity user = userService.fetchUserInfo(userName);
        if (user == null) {
            return false;
        }
        return true;
    }


    private Integer checkAgentExists(String userName) {

        Integer res = 0;
        AgentInfoEntity agent = userService.fetchAgentInfo(userName);
        if (agent != null) {
            res = agent.getId();
        }
        return res;
    }

}
