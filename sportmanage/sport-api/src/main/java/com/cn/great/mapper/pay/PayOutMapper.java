package com.cn.great.mapper.pay;

import com.cn.great.model.pay.PayOutEntity;
import com.cn.great.req.pay.PayReq;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PayOutMapper {

    int insert(PayOutEntity record);

    int checkNotApprovalOrder(@Param("userId") int userId);

    List<PayOutEntity> fetchList(PayReq pay);

    Integer count(PayReq pay);

    /**
     *
     * @param id
     * @return
     */
    PayOutEntity selectById(Integer id);

    void updateStatus(PayOutEntity payOutEntity);
}