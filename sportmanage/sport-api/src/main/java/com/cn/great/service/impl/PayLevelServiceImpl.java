package com.cn.great.service.impl;

import com.cn.great.mapper.pay.BankDataMapper;
import com.cn.great.mapper.pay.PayLevelMapper;
import com.cn.great.mapper.pay.PayTypeNameMapper;
import com.cn.great.model.pay.BankDataEntity;
import com.cn.great.model.pay.PayLevelEntity;
import com.cn.great.model.pay.PayTypeEntity;
import com.cn.great.req.pay.BankDataReq;
import com.cn.great.req.pay.MapDataRep;
import com.cn.great.req.pay.PayLevelReq;
import com.cn.great.service.BankDataService;
import com.cn.great.service.PayLevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


/**
 * @Description: 用户管理Service
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */
@Service
public class PayLevelServiceImpl implements PayLevelService {

    @Autowired
    private PayLevelMapper payLevelMapper;

    @Override
    public List<PayLevelEntity> fetchList(PayLevelReq payLevelReq) {

        return payLevelMapper.fetchList(payLevelReq);
    }

    @Override
    public Integer count(PayLevelReq payLevelReq) {
        return payLevelMapper.count(payLevelReq);
    }

    @Override
    public void changeStatus(Integer id) {
        PayLevelEntity payLevelEntity =payLevelMapper.selectById(id);
        payLevelEntity.setStatus(payLevelEntity.getStatus()==0?1:0);
        payLevelMapper.update(payLevelEntity);
    }

    @Override
    public void save(PayLevelEntity payLevelEntity) {
        payLevelMapper.insert(payLevelEntity);
    }

    @Override
    public void update(PayLevelEntity payLevelEntity) {
        payLevelMapper.update(payLevelEntity);
    }
}
