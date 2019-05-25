package com.cn.great.mapper.pay;

import com.cn.great.model.pay.BankDataEntity;
import com.cn.great.model.pay.PayLevelEntity;
import com.cn.great.req.pay.PayLevelReq;

import java.util.List;

public interface PayLevelMapper {

    List<PayLevelEntity> getUserfulLevels();

    List<PayLevelEntity> fetchList(PayLevelReq payLevelReq);

    Integer count(PayLevelReq payLevelReq);

    PayLevelEntity selectById(Integer id);

    void update(PayLevelEntity payLevelEntity);

    void insert(PayLevelEntity payLevelEntity);
}