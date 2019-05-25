package com.cn.great.model.payment;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
@Builder
public class PayOutEntity implements Serializable {

    private static final long serialVersionUID = -1682326945882564071L;
    private Integer id;

    private Integer userid;

    private BigDecimal goldf;

    private BigDecimal gold;

    private BigDecimal golds;

    private Integer bankId;

    private String order_code;

    private Date add_date;

    private String notes;

    private Integer auditor;

    private Integer operator;

    private Integer payId;

    private Integer status;

    private String ip;

    private Integer type;

    private String serverAdmin;

}