package com.cn.great.service.impl;

import com.cn.great.mapper.agent.ConfigMapper;
import com.cn.great.model.user.AgentInfoEntity;
import com.cn.great.model.user.AgentUrlEntity;
import com.cn.great.model.user.BankInfoEntity;
import com.cn.great.req.agent.AgentOpeReq;
import com.cn.great.req.agent.AgentReq;
import com.cn.great.req.agent.AgentUrlOpeReq;
import com.cn.great.req.agent.AgentUrlReq;
import com.cn.great.service.ConfigService;
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
public class ConfigServiceImpl implements ConfigService {

    @Autowired
    private ConfigMapper configMapper;

    @Override
    public List<AgentInfoEntity> fetchAllAgents() {
        return configMapper.fetchAllAgents();
    }

    @Override
    public List<AgentUrlEntity> fetchAgentUrlsList(AgentUrlReq agentUrlReq) {
        return configMapper.fetchAgentUrlsList(agentUrlReq);
    }

    @Override
    public Integer countAgents(AgentUrlReq agentUrlReq) {
        return configMapper.countAgents(agentUrlReq);
    }

    @Transactional
    @Override
    public void addAgentInfo(AgentUrlOpeReq agentOpeReq) {
        configMapper.addAgentInfo(agentOpeReq);
    }

    @Transactional
    @Override
    public void updateAgentInfo(AgentUrlOpeReq agentOpeReq) {
        configMapper.updateAgentInfo(agentOpeReq);
    }

    @Transactional
    @Override
    public void deleteAgentInfo(Integer id) {
        configMapper.deleteAgentInfo(id);
    }

}
