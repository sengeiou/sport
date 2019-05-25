package com.cn.great.model.bill;

import com.cn.great.model.common.SummaryEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/** 
* @Description: AG注单
* @Param:  
* @return:  
* @Author: Stamp 
* @Date: 2019/5/20 
*/
@Data
public class AgBill extends SummaryEntity {

    private Long id;

    private String billno;

    private Integer userid;

    private String gameCode;

    private BigDecimal netAmount;

    private Date betTime;

    private String gameType;

    private BigDecimal betAmount;

    private BigDecimal validBetAmount;

    private Boolean flag;

    private Integer playType;

    private String currency;

    private Long loginIp;

    private Date recalcuTime;

    private String platformType;

    private String round;

    private Integer remark;

    //会员账号
    private String userName;
}