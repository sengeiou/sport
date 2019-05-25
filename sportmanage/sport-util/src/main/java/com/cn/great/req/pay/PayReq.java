package com.cn.great.req.pay;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

import java.io.Serializable;

/**
 * @program: sport
 * @description: 站内信详情 对应web_message_data表
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class PayReq extends BaseEntity implements Serializable {

    private Integer id;
    private String username;
    //支付方式类型：1，线上 2，线下 3， 额度转换 4，人工入款 5，活动入款
    private Integer type;
    private String orderId;
    private Integer status;

    private Integer userId;

    private String statusStr;


}
