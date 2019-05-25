package com.cn.great.mapper.pay;

import com.cn.great.model.pay.BankDataEntity;
import com.cn.great.model.pay.PayLevelEntity;
import com.cn.great.model.pay.PaymentDataEntity;
import com.cn.great.req.pay.PayLevelReq;
import com.cn.great.req.pay.PaymentReq;

import java.util.List;

public interface PaymentDataMapper {

    List<PaymentDataEntity> fetchList(PaymentReq paymentReq);

    PaymentDataEntity selectById(Integer id);

    void update(PaymentDataEntity paymentDataEntity);

    void insert(PaymentDataEntity paymentDataEntity);

    Integer count(PaymentReq paymentReq);
}