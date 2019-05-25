package com.cn.great.mapper.pay;

import com.cn.great.model.pay.PayInEntity;
import com.cn.great.req.pay.PayReq;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;


public interface PayInMapper {

    int insert(PayInEntity record);

    int checkNotApprovalIn(@Param("userId") int userId);


    Integer count(@Param("payReq")PayReq payReq);

    List<PayInEntity> fetchList(@Param("payReq")PayReq payReq);

    PayInEntity selectById(Integer id);

    /**
     * 修改
     * @param payIn
     */
    void update(PayInEntity payIn);

    /**
     * 查询最近一条充值记录
     * @param userId
     * @return
     */
    PayInEntity selectLast(Integer userId);

    /**
     *
     * @param userId
     * @return
     */
    BigDecimal sumAmount(Integer userId);
}