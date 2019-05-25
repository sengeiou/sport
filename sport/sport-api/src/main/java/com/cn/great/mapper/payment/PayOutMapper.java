package com.cn.great.mapper.payment;

import com.cn.great.model.payment.PayOutEntity;
import com.cn.great.req.payment.WithdrawReq;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PayOutMapper {

    int insert(PayOutEntity record);

    int checkNotApprovalOrder(@Param("userId") int userId);

    List<PayOutEntity> getWithdrawalLog(WithdrawReq req);
}