package com.cn.great.model.bill;

import com.cn.great.model.common.SummaryEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class LotteryBill extends SummaryEntity {
    private Integer id;

    private Integer userid;

    private Integer gameCode;

    private Integer typeCode;

    private Integer happy8;

    private String round;

    private BigDecimal dropMoney;

    private String dropContent;

    private BigDecimal total;

    private BigDecimal validMoney;

    private BigDecimal userWin;

    private BigDecimal userCut;

    private BigDecimal userRate;

    private String xqRate;

    private Integer countPay;

    private Long betIp;

    private Date betTime;

    private Integer xqDeId;

    private Integer countStatus;

    private String orderNumber;

    //会员账号
    private String userName;

}