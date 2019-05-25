package com.cn.great.service;

import com.cn.great.model.pay.BankDataEntity;
import com.cn.great.model.pay.PayInEntity;
import com.cn.great.model.pay.PayOutEntity;
import com.cn.great.req.pay.BankDataReq;
import com.cn.great.req.pay.MapDataRep;
import com.cn.great.req.pay.PayOutRep;
import com.cn.great.req.pay.PayReq;

import java.util.List;

/**
 * @Description: 会员管理Service接口
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */

public interface BankDataService {
    /**
     * 线下入款的配置列表
     * @param bankDataReq
     * @return
     */
    List<BankDataEntity> fetchList(BankDataReq bankDataReq);

    /**
     * 汇总
     * @param bankDataReq
     * @return
     */
    Integer count(BankDataReq bankDataReq);

    void changeStatus(Integer id);

    void save(BankDataEntity bankDataEntity);

    void update(BankDataEntity bankDataEntity);

    List<MapDataRep> getPayTypeData();

    List<MapDataRep> getLevelData();

    List<MapDataRep> getPayBankData();
}
