package com.cn.great.model.payment;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
@Builder
public class PayInEntity implements Serializable {

    private static final long serialVersionUID = -7749729979156544331L;
    private Integer id;

    private Integer userid;

    private BigDecimal goldf;

    private BigDecimal gold;

    private BigDecimal golds;

    private String order_code;

    private BigDecimal youhuiGold;

    private Date add_date;

    private String notes;

    private Integer operator;

    private Integer payId;

    private Integer pay_type_id;

    private Integer paymentNameId;

    private Integer status;

    private String ip;

    private Integer type;

    private String serverAdmin;
}