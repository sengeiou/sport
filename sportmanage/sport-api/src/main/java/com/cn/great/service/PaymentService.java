package com.cn.great.service;

import com.cn.great.model.pay.BankDataEntity;
import com.cn.great.model.pay.PayLevelEntity;
import com.cn.great.model.pay.PaymentDataEntity;
import com.cn.great.req.pay.PayLevelReq;
import com.cn.great.req.pay.PaymentReq;

import java.util.List;

/**
 * @Description: 支付等级Service接口
 * @Author: zach.M
 * @Date: 2019/5/4
 */

public interface PaymentService {

    List<PaymentDataEntity> fetchList(PaymentReq paymentReq);

    Integer count(PaymentReq paymentReq);

    void changeStatus(Integer id);

    void save(PaymentDataEntity paymentDataEntity);

    void update(PaymentDataEntity paymentDataEntity);
}
