package com.cn.great.req.payment;

import lombok.Data;

@Data
public class DepositReq {

    //银支付通道id 关联web_bank_data
    private Integer id;
    //提交金额
    private String gold;
    //用户昵称
    private String nick_name;
    //交易单号
    private String trans_number;
    //交易日期 yyyy-mm-dd hh-mm-ss
    private String datetime;

    private Integer userId;

    private String start_date;

    private String end_date;
}
