package com.cn.great.model.payment;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

@Data
@Builder
public class BankNameEntity implements Serializable {
    private static final long serialVersionUID = 6758754152784652674L;

    private Integer id;

    private String bank;

    private String code;

}