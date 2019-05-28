package com.cn.great.service.impl;

import com.cn.great.mapper.agent.AgentMapper;
import com.cn.great.model.common.Constant;
import com.cn.great.model.user.AgentInfoEntity;
import com.cn.great.model.user.BankInfoEntity;
import com.cn.great.req.agent.AgentOpeReq;
import com.cn.great.req.agent.AgentReq;
import com.cn.great.req.user.ResetPwdReq;
import com.cn.great.service.AgentService;
import com.cn.great.util.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * @program: agentmanage
 * @description: 代理serviceimpl
 * @author: Stamp
 * @create: 2019-04-17 11:16
 **/
@Service
@Slf4j
public class AgentServiceImpl implements AgentService {

    @Autowired
    private AgentMapper agentMapper;
    @Autowired
    private RedisUtil redisUtil;

    @Override
    public List<AgentInfoEntity> fetchAgentList(AgentReq agentReq) {
        return agentMapper.fetchAgentList(agentReq);
    }

    @Override
    public Integer countAgents(AgentReq agentReq) {
        return agentMapper.countAgents(agentReq);
    }

    @Override
    public boolean checkAgentExists(String userName) {
        return agentMapper.fetchTotalByName(userName) == 0;
    }

    @Transactional
    @Override
    public void addAgentInfo(AgentOpeReq agentOpeReq) {
        agentMapper.addAgentInfo(agentOpeReq);
        AgentInfoEntity agent = agentMapper.fetchAgentByName(agentOpeReq.getUserName()).get(0);
        redisUtil.set(agentOpeReq.getUserName() + Constant.AGENT_INFO_CACHE_SALT, agent);
    }

    @Override
    public List<BankInfoEntity> fetchBanks() {
        return agentMapper.fetchBanks();
    }

    @Override
    public AgentInfoEntity fetchAgentById(Integer id) {
        List<AgentInfoEntity> agents = agentMapper.fetchAgentById(id);
        if (!CollectionUtils.isEmpty(agents))
            return agents.get(0);
        else
            return null;
    }

    @Override
    public List<AgentInfoEntity> fetchAgentByName(String userName) {
        return agentMapper.fetchAgentByName(userName);
    }

    @Transactional
    @Override
    public void resetAgentPwd(ResetPwdReq resetPwdReq) {
        agentMapper.resetAgentPwd(resetPwdReq);
    }

    @Transactional
    @Override
    public void updateAgentInfo(AgentOpeReq agentOpeReq) {
        agentMapper.updateAgentInfo(agentOpeReq);
        AgentInfoEntity agent = agentMapper.fetchAgentByName(agentOpeReq.getUserName()).get(0);
        redisUtil.set(agentOpeReq.getUserName() + Constant.AGENT_INFO_CACHE_SALT, agent);
    }

    @Transactional
    @Override
    public void deleteAgentInfo(Integer id) {
        List<AgentInfoEntity> list = agentMapper.fetchAgentById(id);
        if (CollectionUtils.isEmpty(list))
            return;
        AgentInfoEntity agent = list.get(0);
        agentMapper.deleteAgentInfo(id);
        redisUtil.delObj(agent.getUserName() + Constant.AGENT_INFO_CACHE_SALT);
    }

    @Override
    public Integer getAgentRoleId() {
        return agentMapper.getAgentRoleId();
    }

}
