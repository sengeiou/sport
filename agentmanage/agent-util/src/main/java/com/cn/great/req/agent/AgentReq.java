package com.cn.great.req.agent;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: agentmanage
 * @description: 代理列表查询
 * @author: Stamp
 * @create: 2019-04-10 09:03
 **/
@Data
public class AgentReq extends BaseEntity {

    private String userName;
    private String alias;
    private Integer status;

}
