package com.cn.great.model.pay;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

@Data
public class BankDataEntity implements Serializable {

    private static final long serialVersionUID = 7273366853954401709L;
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

    private String levelName;
    private String payTypeName;

}