package com.cn.great.req.bill;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: agentmanage
 * @description: 彩票注单查询
 * @author: Stamp
 * @create: 2019-05-19 15:28
 **/
@Data
public class LotteryBillReq extends BaseEntity {
    private String orderNumber;
    private String round;
    private Integer countStatus;
}
