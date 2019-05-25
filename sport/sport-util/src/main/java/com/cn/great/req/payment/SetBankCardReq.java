package com.cn.great.req.payment;

import lombok.Data;

@Data
public class SetBankCardReq {

    private String code;
    private String bank_account;
    private String bank_address;
    private Integer userId;
}
