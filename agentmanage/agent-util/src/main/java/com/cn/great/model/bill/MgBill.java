package com.cn.great.model.bill;

import com.cn.great.model.common.SummaryEntity;
import lombok.Data;

import java.math.BigDecimal;

/**
* @Description: MG电子注单
* @Author: Stamp
* @Date: 2019/5/19
*/
@Data
public class MgBill extends SummaryEntity {

    private String key;

    private Long colid;

    private String type;

    private Long transactiontimestampdate;

    private BigDecimal amount;

    private String mbrcode;

    private String gamecasinoid;

    private BigDecimal aftertxwalletamount;

    private Integer mgsgameid;

    private String gameplatformtype;

    private Integer userid;

    //会员账号
    private String userName;
}