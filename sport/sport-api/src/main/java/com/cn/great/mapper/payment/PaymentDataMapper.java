package com.cn.great.mapper.payment;

import com.cn.great.model.payment.PaymentDataEntity;
import com.cn.great.req.payment.PaymentChannelReq;

import java.util.List;

public interface PaymentDataMapper {

    List<PaymentDataEntity> getOnlineChannel(PaymentChannelReq req);
}