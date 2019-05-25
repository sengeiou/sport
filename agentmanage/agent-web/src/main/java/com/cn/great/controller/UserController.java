package com.cn.great.controller;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.BaseEntity;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.user.*;
import com.cn.great.req.user.UserInfoReq;
import com.cn.great.req.user.UserOpeReq;
import com.cn.great.service.AgentService;
import com.cn.great.service.ConfigService;
import com.cn.great.service.UserService;
import com.cn.great.util.CommonMethodUtils;
import com.cn.great.util.DateUtils;
import com.cn.great.util.IPUtils;
import com.cn.great.util.MD5Utils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: agentManage
 * @description: 会员列表
 * @author: Stamp.M
 * @create: 2019-03-06 19:20
 **/
@Controller
@RequestMapping("user")
@Slf4j
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private ConfigService configService;
    @Resource
    private AgentService agentService;

    /**
     * @Description: 会员页面跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    @RequestMapping("userPage")
    public String userPage(Model model, HttpServletRequest request) {
        //查询代理信息
        List<AgentInfoEntity> agents = configService.fetchAllAgents();
        request.getSession().setAttribute(Constant.AGENT_INFO_SESSION, agents);
        model.addAttribute("agents", agents);
        //查询支付分层信息
        List<PayLevelEntity> payLevels = userService.fetchAllPayLevel();
        model.addAttribute("levels", payLevels);
        //查询线下银行支付配置
        List<BankInfoEntity> banks = agentService.fetchBanks();
        model.addAttribute("banks", banks);
        request.getSession().setAttribute(Constant.BANK_INFO_SESSION, banks);
        return "user/userinfo";
    }


    /**
     * @Description: 会员列表查询
     * @Param: [userInfoReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    @PostMapping(value = "userList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity userList(@RequestBody UserInfoReq userInfoReq, HttpServletRequest request) throws GeneralException {
        List<UserEntity> users = userService.fetchUserList(userInfoReq);
        Integer recordsTotal = userService.countUsers(userInfoReq);
        return ResponseEntity.initGeneralResponseRes(users, recordsTotal);
    }


    /**
     * @Description: 新增会员
     * @Param: [userReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/4/13
     */
    @PostMapping(value = "add", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity add(@RequestBody @Valid UserOpeReq userReq, HttpServletRequest request) throws GeneralException {
        String userName = userReq.getUserName();
        //校验用户名是否已存在
        if (!userService.checkUserNameExist(userName))
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ACCOUNT_EXISTS_ERROR);
        UserInfoEntity userInfo = CommonMethodUtils.generateUserInfo(userReq);
        String password = MD5Utils.encodeByMD5(userReq.getPassword());
        userInfo.setPassword(password);
        Integer userId = userService.addUserInfo(userInfo);
        MemberInfoEntity memberInfo = CommonMethodUtils.generateMemberInfo(userReq);
        memberInfo.setUserId(userId);
        memberInfo.setAddDate(DateUtils.getDateTime());
        String withdrawalPasswd = MD5Utils.encodeByMD5(userReq.getWithdrawalPasswd());
        memberInfo.setWithdrawalPasswd(withdrawalPasswd);
        String ip = IPUtils.getRealIp(request, 0);
        memberInfo.setRegIp(ip);
        userService.addMemberInfo(memberInfo);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
     * @Description: 修改会员
     * @Param: [userReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/4/13
     */
    @PostMapping(value = "/update", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity update(@RequestBody UserOpeReq userReq, HttpServletRequest request) throws GeneralException {

        String password = userReq.getPassword();
        if (StringUtils.isNotBlank(password)) {
            password = MD5Utils.encodeByMD5(password);
            userReq.setPassword(password);
        }
        String withdrawalPasswd = userReq.getWithdrawalPasswd();
        if (StringUtils.isNotBlank(withdrawalPasswd)) {
            withdrawalPasswd = MD5Utils.encodeByMD5(withdrawalPasswd);
            userReq.setWithdrawalPasswd(withdrawalPasswd);
        }
        userService.updateUserInfo(userReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
     * @Description: 物理删除会员
     * @Param: [id, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/4/13
     */
    @PostMapping(value = "remove", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity remove(@RequestBody BaseEntity baseEntity, HttpServletRequest request) throws GeneralException {
        if (baseEntity.getId() == null)
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.FIELD_NOT_STANDARD_ERROR);
        userService.deleteSystemAdmin(baseEntity.getId());
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /** 
    * @Description: 会员篮球或足球限制下注 
    * @Param: [userInfoReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/5/19 
    */
    @PostMapping(value = "limit", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity limit(@RequestBody UserInfoReq userInfoReq, HttpServletRequest request) throws GeneralException {
        Integer type = userInfoReq.getType();
        if(type == 1){
            userService.updateMemberBkLimit(userInfoReq);
        }else{
            userService.updateMemberFTLimit(userInfoReq);
        }
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /** 
    * @Description: 用户踢线
    * @Param: [userInfoReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/5/19 
    */
    @PostMapping(value = "out", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity out(@RequestBody UserInfoReq userInfoReq, HttpServletRequest request) throws GeneralException {

        String userName = userInfoReq.getUserName();
        userService.updateLoginInfo(userName);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
     * @Description: 查询所有的代理信息
     * @Param: [agentReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/13
     */
    @PostMapping(value = "agents", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity agents(HttpServletRequest request) throws GeneralException {
        List<AgentInfoEntity> agents = new ArrayList<>();
        Object obj = request.getSession().getAttribute(Constant.AGENT_INFO_SESSION);
        if (obj != null) {
            agents.addAll((List<AgentInfoEntity>) obj);
        }
        return ResponseEntity.initGeneralResponseRes(agents, agents.size());
    }

    /**
     * @Description: 查询所有的银行支付信息
     * @Param: [request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    @PostMapping(value = "banks", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity banks(HttpServletRequest request) throws GeneralException {
        List<BankInfoEntity> banks = new ArrayList<>();
        Object obj = request.getSession().getAttribute(Constant.BANK_INFO_SESSION);
        if (obj != null) {
            banks.addAll((List<BankInfoEntity>) obj);
        }
        return ResponseEntity.initGeneralResponseRes(banks, banks.size());
    }

}
