package com.cn.great.mapper.payment;

import com.cn.great.model.payment.BankDataEntity;
import com.cn.great.req.payment.PaymentChannelReq;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BankDataMapper {

    List<BankDataEntity> getOfflineChannel(PaymentChannelReq req);

    Double getValidChannel(@Param("id") int id);
}