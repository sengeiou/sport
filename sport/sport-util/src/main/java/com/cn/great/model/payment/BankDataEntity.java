package com.cn.great.model.payment;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

@Data
@Builder
public class BankDataEntity implements Serializable {

    private static final long serialVersionUID = 7273366853954401709L;
    private Integer id;

    private String bank;

    private String bank_account;

    private String bankAddress;

    private String bank_name;

    private Integer levelId;

    private String status;

    private String img_url;

    private Integer max;

    private Integer min;

    private Double discount_rate;

    private String serverAdmin;

    private String payType;

}