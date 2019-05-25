package com.cn.great.model.discount;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class ConditionEntity implements Serializable {

    private static final long serialVersionUID = -4884300323260301077L;

    private int id;
    //活动名称
    private String name;
    //活动条件   
    private String condition;
    //白名单
    private String white;
    //黑名单
    private String black;
    //内测账号
    private String beta;
    //活动开始时间
    private Date startTime;
    //活动结束时间
    private Date endTime;
    //领取总额
    private BigDecimal total;
    //已领取总额
    private BigDecimal getMoney;
    //0-内测1-启用2-伪删除
    private int status;
    //总代理
    private String serverAdmin;
}
