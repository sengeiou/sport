package com.cn.great.model.pay;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class PaymentDataEntity implements Serializable {
    private static final long serialVersionUID = -4698216804179633474L;
    private Integer id;

    private String accountCompany;

    private String payUrl;

    private String businessCode;

    private String baofooid;

    private String payType;

    private Integer status;

    private String type;

    private BigDecimal totalMoney;

    private Integer totalTime;

    private Integer levelId;

    private Long min;

    private Long max;

    private Double discountRate;

    private String notes;

    private String chooseBank;

    private String payBank;

    private BigDecimal feesRate;

    private String serverAdmin;

    private String businessPwd;

    private String key2;

    private String  payTypeName;

    private String payLevelName;
}