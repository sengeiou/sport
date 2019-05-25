package com.cn.great.mapper.payment;


import com.cn.great.model.payment.PayTypeEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PayTypeNameMapper {

    List<PayTypeEntity> getPaymentType(@Param("type") String type);
}