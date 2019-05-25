package com.cn.great.mapper.agent;


import com.cn.great.model.user.AgentInfoEntity;
import com.cn.great.model.user.BankInfoEntity;
import com.cn.great.req.agent.AgentOpeReq;
import com.cn.great.req.agent.AgentReq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AgentMapper {

    List<AgentInfoEntity> fetchAgentList(AgentReq agentReq);

    Integer countAgents(AgentReq agentReq);

    List<AgentInfoEntity> fetchAgentByName(String userName);

    void addAgentInfo(AgentOpeReq agentOpeReq);

    List<BankInfoEntity> fetchBanks();

    List<AgentInfoEntity> fetchAgentById(Integer id);

    void updateAgentInfo(AgentOpeReq agentOpeReq);

    void deleteAgentInfo(Integer id);

    Integer fetchTotalByName(String userName);

    Integer getAgentRoleId();
}
