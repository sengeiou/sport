package com.cn.great.model.user;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
* @Description: 支付分层信息 对应web_pay_level表
* @Author: Stamp
* @Date: 2019/5/14
*/
@Data
public class PayLevelEntity implements Serializable {

    private static final long serialVersionUID = -3503345671305572793L;
    private Integer id;

    private String levelName;

    private Date regStart;

    private Date regEnd;

    private Integer mixCtime;

    private Integer maxCtime;

    private BigDecimal mixAmount;

    private BigDecimal maxAmount;

    private String notes;

    private String serverAdmin;

}