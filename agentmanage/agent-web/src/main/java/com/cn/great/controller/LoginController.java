package com.cn.great.controller;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.auth.AuthInfoEntity;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.system.DictEntity;
import com.cn.great.model.user.AdminInfoEntity;
import com.cn.great.model.user.AgentInfoEntity;
import com.cn.great.req.system.LogOpeReq;
import com.cn.great.req.user.LoginReq;
import com.cn.great.req.user.ResetPwdReq;
import com.cn.great.req.user.UserReq;
import com.cn.great.service.AgentService;
import com.cn.great.service.BillService;
import com.cn.great.service.LogService;
import com.cn.great.service.UserService;
import com.cn.great.util.GeneralUtils;
import com.cn.great.util.IPUtils;
import com.cn.great.util.MD5Utils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Collections;
import java.util.List;
import java.util.Set;


/**
 * @Description: 用户登录和登出
 * @Author: Stamp
 * @Date: 2019/4/9
 */
@Controller
@RequestMapping("/")
public class LoginController {

    @Resource
    private AgentService agentService;
    @Resource
    private UserService userService;
    @Resource
    private BillService billService;
    @Resource
    private LogService logService;


    @RequestMapping("/")
    public String index(Model model, HttpServletRequest request) {
        // 获取所有的球赛类型
        List<DictEntity> ballTypes = billService.fetchEnumsByType("ball_type");
        model.addAttribute("ballTypes", ballTypes);
        // 获取所有的玩法类型
        List<DictEntity> playTypes = billService.fetchEnumsByType("play_type_ball");
        model.addAttribute("playTypes", playTypes);
        request.getSession().setAttribute(Constant.PLAY_BALL_TYPE_SESSION, playTypes);
        // 获取所有的注单确认
        List<DictEntity> billConfirmeTypes = billService.fetchEnumsByType("bill_confirme_type");
        model.addAttribute("billConfirmeTypes", billConfirmeTypes);
        request.getSession().setAttribute(Constant.BILL_CONFIRMED_SESSION, billConfirmeTypes);
        return "bill/sportbill";
    }


    @RequestMapping("/goLogin")
    public String toLogin(Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute(Constant.USER_SESSION_NAME) == null)
            return "login";
        else
            return "redirect:/";
    }

    @PostMapping(value = "login")
    @ResponseBody
    public ResponseEntity login(@RequestBody @Valid LoginReq loginReq, HttpServletRequest request) {
        String userName = loginReq.getUserName();
        List<AuthInfoEntity> auths = userService.fetchAllAuths();
        Set<String> authUrls = GeneralUtils.filterToList(auths);
        request.getSession().setAttribute(Constant.AUTHS_ALL_SESSION, authUrls);
        List<AuthInfoEntity> owenAuths = userService.fetchOwenAuths(userName);
        owenAuths.removeAll(Collections.singleton(null));
        Set<String> ownAuthUrls = GeneralUtils.filterToList(owenAuths);
        request.getSession().setAttribute(Constant.AUTH_OWEN_SESSION, ownAuthUrls);
        String authOwenUrls = GeneralUtils.filterToString(owenAuths);
        request.getSession().setAttribute(Constant.AUTH_OWEN_SESSION_STR, authOwenUrls);
        UserReq userReq = new UserReq();
        userReq.setUserName(userName);
        String encryptPwd = MD5Utils.encodeByMD5(loginReq.getPassword());
        // 获取请求全IP地址
        String ip = IPUtils.getRealIp(request, 1);
        if (StringUtils.equals(userName, "admin")) {
            List<AdminInfoEntity> admins = userService.fetchAdminByName(userName);
            if (CollectionUtils.isEmpty(admins))
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.LOGIN_ERROR);
            AdminInfoEntity admin = admins.get(0);
            if (!StringUtils.equals(encryptPwd, admin.getPassword()) || admin.getStatus() != 0)
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.LOGIN_ERROR);
            request.getSession().setAttribute(Constant.LOGIN_INFO_SESSION, admin);
            LogOpeReq logOpeReq = GeneralUtils.generateLogOpe(admin, ip, "用户登录 >> 代理系统", "");
            logService.addLogInfo(logOpeReq);
        } else {
            List<AgentInfoEntity> agents = agentService.fetchAgentByName(userName);
            if (CollectionUtils.isEmpty(agents))
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.LOGIN_ERROR);
            AgentInfoEntity agent = agents.get(0);
            if (!StringUtils.equals(encryptPwd, agent.getPassword()) || agent.getStatus() != 0)
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.LOGIN_ERROR);
            request.getSession().setAttribute(Constant.LOGIN_INFO_SESSION, agent);
            LogOpeReq logOpeReq = GeneralUtils.generateAgentLogOpe(agent, ip, "用户登录 >> 代理系统", "");
            logService.addLogInfo(logOpeReq);
        }
        request.getSession().setAttribute(Constant.USER_SESSION_NAME, userName);
        return ResponseEntity.initGeneralResponseMsg("success");
    }

    /**
     * @Description: 注销登录
     * @Param: [request, response]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/26
     */
    @RequestMapping(value = "logout", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute(Constant.AUTHS_ALL_SESSION);
        request.getSession().removeAttribute(Constant.AUTH_OWEN_SESSION);
        request.getSession().removeAttribute(Constant.AUTH_OWEN_SESSION_STR);
        request.getSession().removeAttribute(Constant.USER_SESSION_NAME);
        request.getSession().removeAttribute(Constant.LOGIN_INFO_SESSION);
        return ResponseEntity.initGeneralResponseMsg("success");
    }

    /**
     * @Description: 密码重置
     * @Param: [request, response]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/26
     */
    @RequestMapping(value = "resetPwd", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity resetPwd(@RequestBody ResetPwdReq resetPwdReq, HttpServletRequest request, HttpServletResponse response) {
        String userName = (String)request.getSession().getAttribute(Constant.USER_SESSION_NAME);
        resetPwdReq.setUserName(userName);
        String loginOldPassword = MD5Utils.encodeByMD5(resetPwdReq.getLoginOldPassword());
        String loginNewPassword = MD5Utils.encodeByMD5(resetPwdReq.getLoginNewPassword());
        resetPwdReq.setLoginNewPassword(loginNewPassword);
        if(StringUtils.equals(userName,"admin")){
            resetPwdReq.setFlag(2);
            List<AdminInfoEntity> admins = userService.fetchAdminByName(userName);
            if (CollectionUtils.isEmpty(admins))
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
            AdminInfoEntity admin = admins.get(0);
            if (!StringUtils.equals(loginOldPassword, admin.getPassword()))
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.OLD_PASSWORD_ERROR);
        }else{
            resetPwdReq.setFlag(1);
            List<AgentInfoEntity> agents = agentService.fetchAgentByName(userName);
            if (CollectionUtils.isEmpty(agents))
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
            AgentInfoEntity agent = agents.get(0);
            if (!StringUtils.equals(loginOldPassword, agent.getPassword()))
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.OLD_PASSWORD_ERROR);
            agentService.resetAgentPwd(resetPwdReq);
        }
        userService.updateAgentPwd(resetPwdReq);
        return ResponseEntity.initGeneralResponseMsg("success");
    }

    /**
     * @Description: 权限不足页面跳转
     * @Param: [request, response]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/20
     */
    @RequestMapping(value = "noPerm", method = RequestMethod.GET)
    public String noPerm(Model model, HttpServletRequest request) {
        Object obj = request.getSession().getAttribute(Constant.USER_SESSION_NAME);
        if (obj != null)
            model.addAttribute("loginNameSession", obj);
        return "noPerm";
    }


}
