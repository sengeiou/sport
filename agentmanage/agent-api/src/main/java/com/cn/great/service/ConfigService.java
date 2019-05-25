package com.cn.great.service;

import com.cn.great.model.user.AgentInfoEntity;
import com.cn.great.model.user.AgentUrlEntity;
import com.cn.great.req.agent.AgentUrlOpeReq;
import com.cn.great.req.agent.AgentUrlReq;

import java.util.List;

/**
 * @program: agentmanage
 * @description: 代理域名service
 * @author: Stamp
 * @create: 2019-04-17 11:16
 **/
public interface ConfigService {
    /**
     * @Description: 代理信息查询
     * @Param: [agentReq]
     * @return: java.util.List<com.cn.great.model.user.AgentInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    List<AgentInfoEntity> fetchAllAgents();

    /**
     * @Description: 查询代理域名配置信息
     * @Param: [agentUrlReq]
     * @return: java.util.List<com.cn.great.model.user.AgentUrlEntity>
     * @Author: Stamp
     * @Date: 2019/5/13
     */
    List<AgentUrlEntity> fetchAgentUrlsList(AgentUrlReq agentUrlReq);

    /**
     * @Description: 代理数统计
     * @Param: [agentReq]
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    Integer countAgents(AgentUrlReq agentUrlReq);

    /**
     * @Description: 新增代理信息
     * @Param: [agentOpeReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    void addAgentInfo(AgentUrlOpeReq agentOpeReq);

    /**
     * @Description: 代理更新
     * @Param: [agentOpeReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    void updateAgentInfo(AgentUrlOpeReq agentOpeReq);

    /**
     * @Description: 删除代理
     * @Param: [id]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/19
     */
    void deleteAgentInfo(Integer id);

}
