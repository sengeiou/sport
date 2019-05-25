package com.cn.great.controller;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.BaseEntity;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.user.AgentInfoEntity;
import com.cn.great.model.user.BankInfoEntity;
import com.cn.great.req.agent.AgentOpeReq;
import com.cn.great.req.agent.AgentReq;
import com.cn.great.req.user.UserAddReq;
import com.cn.great.req.user.UserUpdateReq;
import com.cn.great.service.AgentService;
import com.cn.great.service.UserService;
import com.cn.great.util.CommonMethodUtils;
import com.cn.great.util.DateUtils;
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
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: sport
 * @description: 代理管理类
 * @author: Stamp.M
 * @create: 2019-03-06 19:20
 **/
@Controller
@RequestMapping("agent")
@Slf4j
public class AgentController {

    @Resource
    private UserService userService;

    @Resource
    private AgentService agentService;


    /**
     * @Description: 代理列表跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("agentPage")
    public String agentPage(Model model, HttpServletRequest request) {
        //查询线下银行支付配置
        List<BankInfoEntity> banks = agentService.fetchBanks();
        model.addAttribute("banks", banks);
        request.getSession().setAttribute(Constant.BANK_INFO_SESSION, banks);
        Object obj = request.getSession().getAttribute(Constant.USER_SESSION_NAME);
        model.addAttribute("loginNameSession", obj);
        return "agent/agentinfo";
    }

    /**
     * @Description: 代理列表查询
     * @Param: [loginReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    @PostMapping(value = "agentList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity agentList(@RequestBody AgentReq agentReq, HttpServletRequest request) throws GeneralException {
        List<AgentInfoEntity> agents = agentService.fetchAgentList(agentReq);
        Integer recordsTotal = agentService.countAgents(agentReq);
        return ResponseEntity.initGeneralResponseRes(agents, recordsTotal);
    }


    /** 
    * @Description: 新增代理 ； 同步新增同名的后台管理员，便于权限控制
    * @Param: [userReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/13 
    */
    @PostMapping(value = "add", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity add(@RequestBody AgentOpeReq agentOpeReq, HttpServletRequest request) throws GeneralException {
        String userName = agentOpeReq.getUserName();
        //校验用户名是否已存在
        if(!agentService.checkAgentExists(userName))
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ACCOUNT_EXISTS_ERROR);
        //新增代理信息
        agentOpeReq.setAddDate(DateUtils.getDateTime());
        String password = MD5Utils.encodeByMD5(agentOpeReq.getPassword());
        agentOpeReq.setPassword(password);
        String passwordSafe = MD5Utils.encodeByMD5(agentOpeReq.getPasswordSafe());
        agentOpeReq.setPasswordSafe(passwordSafe);
        agentService.addAgentInfo(agentOpeReq);
        //新增后台管理员信息
        Integer type = agentService.getAgentRoleId();
        if(type == 0)
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ADD_AGENT_ROLE_MSG);
        UserAddReq userReq = CommonMethodUtils.buildUserAdd(agentOpeReq, type);
        userService.addSystemAdmin(userReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /** 
    * @Description: 修改代理 ； 同步修改同名的后台管理员，便于权限控制
    * @Param: [userReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/13 
    */
    @PostMapping(value = "/update", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity update(@RequestBody AgentOpeReq agentOpeReq, HttpServletRequest request) throws GeneralException {
        //获取代理余额
        AgentInfoEntity agent = agentService.fetchAgentById(agentOpeReq.getId());
        if(agent == null)
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.AGENT_NOT_EXIST_ERROR);
        BigDecimal money = agentOpeReq.getMoney();
        if(money.compareTo(new BigDecimal(0)) != 0){
            BigDecimal credit = agent.getMoney();
            BigDecimal afterMoney = money.add(credit);
            if(afterMoney.compareTo(new BigDecimal(0)) < 0){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.CREDIT_NOT_ENOUGH_ERROR);
            }
            agentOpeReq.setMoney(afterMoney);
            agentOpeReq.setChangeFlag(1);
        }else{
            agentOpeReq.setChangeFlag(0);
        }
        String password = agentOpeReq.getPassword();
        if(StringUtils.isNotBlank(password)){
            password = MD5Utils.encodeByMD5(password);
            agentOpeReq.setPassword(password);
        }
        String passwordSafe = agentOpeReq.getPasswordSafe();
        if(StringUtils.isNotBlank(passwordSafe)){
            passwordSafe = MD5Utils.encodeByMD5(passwordSafe);
            agentOpeReq.setPasswordSafe(passwordSafe);
        }
        //修改代理信息
        agentService.updateAgentInfo(agentOpeReq);
        //修改管理员信息
        UserUpdateReq userReq = CommonMethodUtils.buildUserUpdate(agentOpeReq);
        userService.updateSystemAdmin(userReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /** 
    * @Description: 物理删除代理 ； 同步删除同名的后台管理员，便于权限控制
    * @Param: [id, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/13 
    */
    @PostMapping(value = "remove", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity remove(@RequestBody BaseEntity baseEntity, HttpServletRequest request) throws GeneralException {
        if(baseEntity.getId() == null)
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.FIELD_NOT_STANDARD_ERROR);
        //删除代理
        agentService.deleteAgentInfo(baseEntity.getId());
        //删除管理员
        userService.deleteSystemAdmin(baseEntity.getId());
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /** 
    * @Description: 查询所有的线下银行支付配置
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
        if(obj != null){
            banks.addAll((List<BankInfoEntity>)obj);
        }
        return ResponseEntity.initGeneralResponseRes(banks, banks.size());
    }

}
