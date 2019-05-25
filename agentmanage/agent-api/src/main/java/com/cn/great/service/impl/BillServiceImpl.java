package com.cn.great.service.impl;

import com.cn.great.mapper.bill.BillMapper;
import com.cn.great.model.bill.AgBill;
import com.cn.great.model.bill.LotteryBill;
import com.cn.great.model.bill.MgBill;
import com.cn.great.model.bill.SportBillEntity;
import com.cn.great.req.bill.AGBillReq;
import com.cn.great.req.bill.LotteryBillReq;
import com.cn.great.req.bill.MGBillReq;
import com.cn.great.req.bill.SportBillReq;
import com.cn.great.service.BillService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: agentmanage
 * @description: 注单查询serviceImpl
 * @author: Stamp
 * @create: 2019-05-19 15:50
 **/
@Service
@Slf4j
public class BillServiceImpl implements BillService {

    @Resource
    private BillMapper billMapper;

    @Override
    public List<MgBill> fetchMgList(MGBillReq mgBillReq) {
        return billMapper.fetchMgList(mgBillReq);
    }

    @Override
    public String countMGBill(MGBillReq mgBillReq) {
        return billMapper.countMGBill(mgBillReq);
    }

    @Override
    public List<AgBill> fetchAgList(AGBillReq agBillReq) {
        return billMapper.fetchAgList(agBillReq);
    }

    @Override
    public String countAGBill(AGBillReq agBillReq) {
        return billMapper.countAGBill(agBillReq);
    }

    @Override
    public List<LotteryBill> fetchLotteryList(LotteryBillReq lotteryBillReq) {
        return billMapper.fetchLotteryList(lotteryBillReq);
    }

    @Override
    public String countLotteryBill(LotteryBillReq lotteryBillReq) {
        return billMapper.countLotteryBill(lotteryBillReq);
    }

    @Override
    public List<SportBillEntity> fetchSportList(SportBillReq sportBillReq) {
        return billMapper.fetchSportList(sportBillReq);
    }

    @Override
    public String countSportBill(SportBillReq sportBillReq) {
        return billMapper.countSportBill(sportBillReq);
    }

}
