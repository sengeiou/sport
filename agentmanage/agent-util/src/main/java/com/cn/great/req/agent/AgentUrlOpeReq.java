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
public class AgentUrlOpeReq extends BaseEntity {

    // 代理ID
    private Integer agentId;
    // 代理专属网址
    private String agentUrl;
    // 备注
    private String notes;
    // 总代理
    private String serverAdmin;
    // 状态 0-正常1-伪删除
    private Integer status;

}
