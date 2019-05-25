package com.cn.great.model.user;

import lombok.Data;

import java.io.Serializable;

/**
 * @program: agentmanage
 * @description: 银行信息实体类 对应表 web_bank_data
 * @author: Stamp
 * @create: 2019-04-17 14:46
 **/
@Data
public class BankInfoEntity implements Serializable {

    private static final long serialVersionUID = -9172123292476108601L;
    private Integer id;

    private String bank;

    private String bankAccount;

    private String bankAddress;

    private String bankName;

    private Integer levelId;

    private String status;

    private String imgUrl;

    private Integer max;

    private Integer min;

    private Double discountRate;

    private String serverAdmin;

    private String payType;

}
