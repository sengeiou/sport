package com.cn.great.service.impl;

import com.cn.great.mapper.pay.PayLevelMapper;
import com.cn.great.mapper.pay.PaymentDataMapper;
import com.cn.great.model.pay.BankDataEntity;
import com.cn.great.model.pay.PayLevelEntity;
import com.cn.great.model.pay.PaymentDataEntity;
import com.cn.great.req.pay.PayLevelReq;
import com.cn.great.req.pay.PaymentReq;
import com.cn.great.service.PayLevelService;
import com.cn.great.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @Description: 用户管理Service
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */
@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentDataMapper paymentDataMapper;

    @Override
    public List<PaymentDataEntity> fetchList(PaymentReq paymentReq) {

        return paymentDataMapper.fetchList(paymentReq);
    }

    @Override
    public Integer count(PaymentReq paymentReq) {
        return paymentDataMapper.count(paymentReq);
    }

    @Override
    public void changeStatus(Integer id) {
        PaymentDataEntity paymentDataEntity =paymentDataMapper.selectById(id);
        paymentDataEntity.setStatus(paymentDataEntity.getStatus()==0?1:0);
        paymentDataMapper.update(paymentDataEntity);
    }

    @Override
    public void save(PaymentDataEntity paymentDataEntity) {
        paymentDataMapper.insert(paymentDataEntity);
    }

    @Override
    public void update(PaymentDataEntity paymentDataEntity) {
        paymentDataMapper.update(paymentDataEntity);
    }
}
