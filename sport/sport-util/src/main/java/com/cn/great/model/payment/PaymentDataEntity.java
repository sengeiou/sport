package com.cn.great.model.payment;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
@Builder
public class PaymentDataEntity implements Serializable {
    private static final long serialVersionUID = -4698216804179633474L;
    private Integer id;

    private Integer third_plat;

    private String pay_url;

    private String businessCode;

    private String baofooid;

    private String payType;

    private String status;

    private String type;

    private BigDecimal totalMoney;

    private Integer totalTime;

    private Integer levelId;

    private Long min;

    private Long max;

    private Double discount_rate;

    private String notes;

    private String choose_bank;

    private String payBank;

    private BigDecimal feesRate;

    private String serverAdmin;

    private String businessPwd;

    private String key2;

}