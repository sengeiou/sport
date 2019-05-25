package com.cn.great.req.agent;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: agentmanage
 * @description: 代理域名列表查询
 * @author: Stamp
 * @create: 2019-04-10 09:03
 **/
@Data
public class AgentUrlReq extends BaseEntity {

    private Integer agentId;
    private Integer status;

}
