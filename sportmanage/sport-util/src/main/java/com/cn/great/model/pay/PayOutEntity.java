package com.cn.great.model.pay;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class PayOutEntity implements Serializable {

    private static final long serialVersionUID = -1682326945882564071L;
    private Integer id;

    private Integer userid;

    private BigDecimal goldf;

    private BigDecimal gold;

    private BigDecimal golds;

    private Integer bankId;

    private String orderCode;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") //Jackson包使用注解
    private Date addDate;

    private String notes;

    private Integer auditor;

    private Integer operator;

    private Integer payId;

    private Integer status;

    private String ip;

    private Integer type;

    private String serverAdmin;

    private String username;
    private String bankAccount;

}