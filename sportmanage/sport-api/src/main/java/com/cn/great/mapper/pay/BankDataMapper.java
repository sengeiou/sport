package com.cn.great.mapper.pay;

import com.cn.great.model.pay.BankDataEntity;
import com.cn.great.req.pay.BankDataReq;
import com.cn.great.req.pay.MapDataRep;

import java.util.List;


public interface BankDataMapper {
    List<BankDataEntity> fetchList(BankDataReq bankDataReq);

    Integer count(BankDataReq bankDataReq);

    void save(BankDataEntity bankDataEntity);

    BankDataEntity selectById(Integer id);

    void update(BankDataEntity bankDataEntity);

    List<MapDataRep> getPayBankData();
}