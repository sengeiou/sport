package com.cn.great.service;

import com.cn.great.model.user.AgentInfoEntity;
import com.cn.great.model.user.BankInfoEntity;
import com.cn.great.req.agent.AgentOpeReq;
import com.cn.great.req.agent.AgentReq;

import java.util.List;

/**
 * @program: agentmanage
 * @description: 代理service
 * @author: Stamp
 * @create: 2019-04-17 11:16
 **/
public interface AgentService {
    /**
     * @Description: 代理信息查询
     * @Param: [agentReq]
     * @return: java.util.List<com.cn.great.model.user.AgentInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    List<AgentInfoEntity> fetchAgentList(AgentReq agentReq);

    /**
     * @Description: 代理数统计
     * @Param: [agentReq]
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    Integer countAgents(AgentReq agentReq);

    /**
     * @Description: 校验用户名是否存在
     * @Param: [userName]
     * @return: boolean
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    boolean checkAgentExists(String userName);

    /**
     * @Description: 新增代理信息
     * @Param: [agentOpeReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    void addAgentInfo(AgentOpeReq agentOpeReq);

    /**
     * @Description: 查询银行卡信息
     * @Param: []
     * @return: java.util.List<com.cn.great.model.user.BankInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    List<BankInfoEntity> fetchBanks();

    /**
     * @Description: 根据代理名称获取代理信息
     * @Param: [userName]
     * @return: com.cn.great.model.user.AgentInfoEntity
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    AgentInfoEntity fetchAgentById(Integer id);

    /**
     * @Description: 根据用户名查询代理信息
     * @Param: [userName]
     * @return: java.util.List<com.cn.great.model.user.AgentInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/19
     */
    List<AgentInfoEntity> fetchAgentByName(String userName);

    /**
     * @Description: 代理更新
     * @Param: [agentOpeReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    void updateAgentInfo(AgentOpeReq agentOpeReq);

    /**
     * @Description: 删除代理
     * @Param: [id]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/19
     */
    void deleteAgentInfo(Integer id);

    /**
     * @Description: 获取普通代理的id
     * @Param: []
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/4/19
     */
    Integer getAgentRoleId();
}
