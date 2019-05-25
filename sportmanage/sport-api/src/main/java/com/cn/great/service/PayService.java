package com.cn.great.service;

import com.cn.great.model.pay.PayInEntity;
import com.cn.great.model.pay.PayOutEntity;
import com.cn.great.req.pay.PayOutRep;
import com.cn.great.req.pay.PayReq;

import java.util.List;
import java.util.Map;

/**
 * @Description: 会员管理Service接口
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */

public interface PayService {
    /**
     * 数量
     * @param payReq
     * @return
     */
    Integer countPayIn(PayReq payReq);

    /**
     * 列表
     * @param payReq
     * @return
     */
    List<PayInEntity> fetchPayInList(PayReq payReq);

    /**
     * 审核
     * @param id
     */
    void payInCheck(Integer id);

    List<PayOutEntity> fetchPayOutList(PayReq pay);

    Integer countPayOut(PayReq pay);

    /**
     * 出款审核需要展示的汇总数据
     * @param userId
     * @return
     */
    PayOutRep count4PayOut(Integer userId);

    /**
     * 修改状态
     * @param id
     * @param toStatus
     */
    void updateStatus(Integer id, Integer toStatus);
}
