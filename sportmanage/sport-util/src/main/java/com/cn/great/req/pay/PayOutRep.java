package com.cn.great.req.pay;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @program: sport
 * @description: 出款审核展示数据对应的实体类
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class PayOutRep  implements Serializable {
    //上次存款到现在的流水额
    private BigDecimal lastFlowCount=BigDecimal.ZERO;
    //流水总额
    private BigDecimal flowCount;
    //充值总额
    private BigDecimal payInCount;
    //上次充值金额
    private BigDecimal lastPayIn=BigDecimal.ZERO;

    private String alias;

}
