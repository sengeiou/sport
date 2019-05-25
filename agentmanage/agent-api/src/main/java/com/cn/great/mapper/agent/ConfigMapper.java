package com.cn.great.mapper.agent;


import com.cn.great.model.user.AgentInfoEntity;
import com.cn.great.model.user.AgentUrlEntity;
import com.cn.great.req.agent.AgentUrlOpeReq;
import com.cn.great.req.agent.AgentUrlReq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ConfigMapper {

    List<AgentInfoEntity> fetchAllAgents();

    List<AgentUrlEntity> fetchAgentUrlsList(AgentUrlReq agentUrlReq);

    Integer countAgents(AgentUrlReq agentUrlReq);

    void addAgentInfo(AgentUrlOpeReq agentOpeReq);

    void updateAgentInfo(AgentUrlOpeReq agentOpeReq);

    void deleteAgentInfo(Integer id);

}
