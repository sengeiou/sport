package com.cn.great.model.payment;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
@Builder
public class MemberLevelEntity implements Serializable {

    private static final long serialVersionUID = -278725068960655475L;
    private Integer id;

    private BigDecimal sumMoney;

    private BigDecimal sumBet;

    private Boolean memLevel;

    private String notes;

    private String serverAdmin;

}