package com.cn.great.model.user;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
@Data
public class MoneyChangeEntity {
    private Integer id;

    private Integer userid;

    private BigDecimal goldf;

    private BigDecimal gold;

    private BigDecimal golds;

    private String order_code;

    private Date add_date;

    private Integer changeTypeId;

    private Long ip;

    private Integer status;

    private String serverAdmin;

    private String type;
}