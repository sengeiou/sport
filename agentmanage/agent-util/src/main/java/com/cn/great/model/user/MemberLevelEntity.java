package com.cn.great.model.user;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @program: sportManage
 * @description: 会员等级 对应web_member_level表
 * @author: Stamp
 * @create: 2019-04-02 13:51
 **/
@Data
public class MemberLevelEntity implements Serializable {

    private static final long serialVersionUID = -1909989725304356811L;

    private Integer id;
    //累计存款
    private BigDecimal sumMoney;
    //累计打码
    private BigDecimal sumBet;
    //会员等级
    private Integer memLevel;
    //备注
    private String notes;
    //总代理
    private String serverAdmin;

}
