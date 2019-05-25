package com.cn.great.req.payment;

import lombok.Data;

@Data
public class PaymentChannelReq {

    //由支付中心首页接口提供
    private String category_id;
    //1:线上 2:线下
    private String type;
    //分层ID
    private Integer levelId;
}
