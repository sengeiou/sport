package com.cn.great.model.user;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class MoneyLogEntity implements Serializable {
    private static final long serialVersionUID = -1958418117400583000L;
    private Integer id;

    private Integer userid;

    //变动前金额
    private BigDecimal moneyf;
    //变动金额
    private BigDecimal money;
    //变动后金额
    private BigDecimal moneys;
    //1-下注2-结算-3活动-4充值-5提款-6额度转换
    private Integer type;
    //关联ID
    private Integer orderId;
    //动态时间
    private String addDate;
    //备注
    private String notes;

}