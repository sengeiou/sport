package com.cn.great.model.payment;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

@Data
@Builder
public class MemberBankEntity implements Serializable {

    private static final long serialVersionUID = 6803834306972262444L;
    //银行卡ID
    private Integer card_id;
    //会员、代理 ID
    private Integer memberId;
    //'0-会员1-代理'
    private Integer type;
    //银行编号，对应web_bank_name id
    private Integer bankNameId;
    //银行代号
    private String code;
    //加密的银行地址
    private String bank_address;
    //加密的银行卡号
    private String bank_account;
    //0-启用1-伪删除
    private Integer status;
    //1-默认银行卡，0-非默认银行卡
    private Integer def_bank;
    //银行名称
    private String bank;
}