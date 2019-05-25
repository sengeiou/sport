package com.cn.great.controller;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.BaseEntity;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.user.AgentInfoEntity;
import com.cn.great.model.user.AgentUrlEntity;
import com.cn.great.req.agent.AgentUrlOpeReq;
import com.cn.great.req.agent.AgentUrlReq;
import com.cn.great.service.ConfigService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: sport
 * @description: 代理域名配置类
 * @author: Stamp.M
 * @create: 2019-03-06 19:20
 **/
@Controller
@RequestMapping("config")
@Slf4j
public class ConfigController {

    @Resource
    private ConfigService configService;


    /**
     * @Description: 代理域名列表跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("configPage")
    public String configPage(Model model, HttpServletRequest request) {
        //查询代理信息
        List<AgentInfoEntity> agents = configService.fetchAllAgents();
        request.getSession().setAttribute(Constant.AGENT_INFO_SESSION, agents);
        model.addAttribute("agents", agents);
        return "agent/configinfo";
    }

    /**
     * @Description: 代理域名列表查询
     * @Param: [loginReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    @PostMapping(value = "configList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity agentList(@RequestBody AgentUrlReq agentReq, HttpServletRequest request) throws GeneralException {
        List<AgentUrlEntity> agentUrls = configService.fetchAgentUrlsList(agentReq);
        Integer recordsTotal = configService.countAgents(agentReq);
        return ResponseEntity.initGeneralResponseRes(agentUrls, recordsTotal);
    }


    /** 
    * @Description: 新增代理域名配置 ； 同步新增同名的后台管理员，便于权限控制
    * @Param: [userReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/13 
    */
    @PostMapping(value = "add", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity add(@RequestBody AgentUrlOpeReq agentOpeReq, HttpServletRequest request) throws GeneralException {
        configService.addAgentInfo(agentOpeReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /** 
    * @Description: 修改代理域名配置； 同步修改同名的后台管理员，便于权限控制
    * @Param: [userReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/13 
    */
    @PostMapping(value = "/update", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity update(@RequestBody AgentUrlOpeReq agentOpeReq, HttpServletRequest request) throws GeneralException {
        configService.updateAgentInfo(agentOpeReq);
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
        configService.deleteAgentInfo(baseEntity.getId());
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
        if(obj != null){
            agents.addAll((List<AgentInfoEntity>)obj);
        }
        return ResponseEntity.initGeneralResponseRes(agents, agents.size());
    }

}
