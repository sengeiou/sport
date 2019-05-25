package com.cn.great.mapper.pay;


import com.cn.great.model.pay.PayTypeEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PayTypeNameMapper {

    List<PayTypeEntity> getPaymentType(@Param("type") String type);

}