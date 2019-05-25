package com.cn.great.model.pay;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

/**
 * 支付类型字典表 web_pay_type_name
 */
@Data
public class PayTypeEntity implements Serializable {
    private static final long serialVersionUID = -3630445770818182273L;

    private Integer id;

    private String name;

    private Integer type;

}