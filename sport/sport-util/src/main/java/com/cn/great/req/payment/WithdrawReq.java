package com.cn.great.req.payment;

import lombok.Data;

@Data
public class WithdrawReq {

    //银行卡ID
    private String bank_id;
    //金额
    private String amount;
    //提款密码
    private String withdraw_password;

    private String start_date;

    private String end_date;

    private Integer userId;
}
