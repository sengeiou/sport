package com.cn.great.service;

import com.cn.great.model.pay.BankDataEntity;
import com.cn.great.model.pay.PayLevelEntity;
import com.cn.great.req.pay.BankDataReq;
import com.cn.great.req.pay.MapDataRep;
import com.cn.great.req.pay.PayLevelReq;

import java.util.List;

/**
 * @Description: 支付等级Service接口
 * @Author: zach.M
 * @Date: 2019/5/4
 */

public interface PayLevelService {

    List<PayLevelEntity> fetchList(PayLevelReq payLevelReq);

    Integer count(PayLevelReq payLevelReq);

    void changeStatus(Integer id);

    void save(PayLevelEntity payLevelEntity);

    void update(PayLevelEntity payLevelEntity);
}
