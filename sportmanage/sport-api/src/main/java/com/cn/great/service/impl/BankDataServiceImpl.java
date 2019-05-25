package com.cn.great.service.impl;

import com.cn.great.mapper.pay.*;
import com.cn.great.mapper.sport.SportBillMapper;
import com.cn.great.model.common.Constant;
import com.cn.great.model.pay.*;
import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.pay.BankDataReq;
import com.cn.great.req.pay.MapDataRep;
import com.cn.great.req.pay.PayOutRep;
import com.cn.great.req.pay.PayReq;
import com.cn.great.service.BankDataService;
import com.cn.great.service.PayService;
import com.cn.great.service.UserService;
import com.cn.great.util.RSAUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


/**
 * @Description: 用户管理Service
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */
@Service
public class BankDataServiceImpl implements BankDataService {
    @Autowired
    private BankDataMapper bankDataMapper;
    @Autowired
    private PayLevelMapper payLevelMapper;
    @Autowired
    private PayTypeNameMapper payTypeNameMapper;
    @Override
    public List<BankDataEntity> fetchList(BankDataReq bankDataReq) {
        return bankDataMapper.fetchList(bankDataReq);

    }

    @Override
    public Integer count(BankDataReq bankDataReq) {
        return bankDataMapper.count(bankDataReq);
    }

    @Override
    public void changeStatus(Integer id) {
        BankDataEntity entity=bankDataMapper.selectById(id);
        String status=entity.getStatus().equals("0")?"1":"0";
        entity.setStatus(status);
        bankDataMapper.update(entity);

    }

    @Override
    public void save(BankDataEntity bankDataEntity) {
        bankDataMapper.save(bankDataEntity);
    }

    @Override
    public void update(BankDataEntity bankDataEntity) {
        bankDataMapper.update(bankDataEntity);
    }

    @Override
    public List<MapDataRep> getPayTypeData() {
        List<PayTypeEntity> list=payTypeNameMapper.getPaymentType(null);
        List<MapDataRep> retList=new ArrayList<>();
        for(PayTypeEntity pay:list){
            MapDataRep rep=new MapDataRep();
            rep.setKey(pay.getId()+"");
            rep.setValue(pay.getName());
            retList.add(rep);
        }
        return retList;
    }

    @Override
    public List<MapDataRep> getLevelData() {
        List<PayLevelEntity> list=payLevelMapper.getUserfulLevels();
        List<MapDataRep> retList=new ArrayList<>();
        for(PayLevelEntity pay:list){
            MapDataRep rep=new MapDataRep();
            rep.setKey(pay.getId()+"");
            rep.setValue(pay.getLevelName());
            retList.add(rep);
        }
        return retList;
    }

    @Override
    public List<MapDataRep> getPayBankData() {
        return bankDataMapper.getPayBankData();
    }
}
