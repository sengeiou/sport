package com.cn.great.mapper.payment;

import com.cn.great.model.payment.PayInEntity;
import com.cn.great.req.payment.DepositReq;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PayInMapper {

    int insert(PayInEntity record);

    int checkNotApprovalIn(@Param("userId") int userId);

    List<PayInEntity> getDepositLogs(DepositReq req);
}