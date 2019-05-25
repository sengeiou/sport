package com.cn.great.mapper.bill;

import com.cn.great.model.bill.AgBill;
import com.cn.great.model.bill.LotteryBill;
import com.cn.great.model.bill.MgBill;
import com.cn.great.model.bill.SportBillEntity;
import com.cn.great.req.bill.AGBillReq;
import com.cn.great.req.bill.LotteryBillReq;
import com.cn.great.req.bill.MGBillReq;
import com.cn.great.req.bill.SportBillReq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BillMapper {
    List<MgBill> fetchMgList(MGBillReq mgBillReq);

    String countMGBill(MGBillReq mgBillReq);

    List<AgBill> fetchAgList(AGBillReq agBillReq);

    String countAGBill(AGBillReq agBillReq);

    List<LotteryBill> fetchLotteryList(LotteryBillReq lotteryBillReq);

    String countLotteryBill(LotteryBillReq lotteryBillReq);

    List<SportBillEntity> fetchSportList(SportBillReq sportBillReq);

    String countSportBill(SportBillReq sportBillReq);
}