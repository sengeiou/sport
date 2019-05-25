package com.cn.great.model.user;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @program: sport
 * @description: 代理域名类 对应web_agents_url表
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class AgentUrlEntity implements Serializable {

    private static final long serialVersionUID = 4743780757394371053L;

    private Integer id;
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
