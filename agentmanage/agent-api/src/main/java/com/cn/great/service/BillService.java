package com.cn.great.service;

import com.cn.great.model.bill.AgBill;
import com.cn.great.model.bill.LotteryBill;
import com.cn.great.model.bill.MgBill;
import com.cn.great.model.bill.SportBillEntity;
import com.cn.great.model.system.DictEntity;
import com.cn.great.req.bill.AGBillReq;
import com.cn.great.req.bill.LotteryBillReq;
import com.cn.great.req.bill.MGBillReq;
import com.cn.great.req.bill.SportBillReq;

import java.util.List;

/**
 * @program: agentmanage
 * @description: 注单查询
 * @author: Stamp
 * @create: 2019-05-19 15:49
 **/
public interface BillService {
    /**
     * @Description: MG注单查询
     * @Param: [mgBillReq]
     * @return: java.util.List<com.cn.great.model.bill.MgBill>
     * @Author: Stamp
     * @Date: 2019/5/20
     */
    List<MgBill> fetchMgList(MGBillReq mgBillReq);

    /**
     * @Description: MG注单汇总
     * @Param: [mgBillReq]
     * @return: java.lang.String[]
     * @Author: Stamp
     * @Date: 2019/5/20
     */
    String countMGBill(MGBillReq mgBillReq);

    /**
     * @Description: 真人注单查询
     * @Param: [agBillReq]
     * @return: java.util.List<com.cn.great.model.bill.AgBill>
     * @Author: Stamp
     * @Date: 2019/5/21
     */
    List<AgBill> fetchAgList(AGBillReq agBillReq);

    /**
     * @Description: 真人注单汇总
     * @Param: [agBillReq]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/21
     */
    String countAGBill(AGBillReq agBillReq);

    /**
     * @Description: 彩票注单查询
     * @Param: [lotteryBillReq]
     * @return: java.util.List<com.cn.great.model.bill.AgBill>
     * @Author: Stamp
     * @Date: 2019/5/21
     */
    List<LotteryBill> fetchLotteryList(LotteryBillReq lotteryBillReq);

    /**
     * @Description: 彩票注单汇总
     * @Param: [lotteryBillReq]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/21
     */
    String countLotteryBill(LotteryBillReq lotteryBillReq);

    /**
     * @Description: 体育赛事注单查询
     * @Param: [sportBillReq]
     * @return: java.util.List<com.cn.great.model.bill.SportBillEntity>
     * @Author: Stamp
     * @Date: 2019/5/21
     */
    List<SportBillEntity> fetchSportList(SportBillReq sportBillReq);

    /**
     * @Description: 体育注单汇总
     * @Param: [sportBillReq]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/21
     */
    String countSportBill(SportBillReq sportBillReq);

    /**
     * @Description: 根据类型编码查询参数
     * @Param: [typeName]
     * @return: java.util.List<com.cn.great.model.system.DictEntity>
     * @Author: Stamp
     * @Date: 2019/5/25
     */
    List<DictEntity> fetchEnumsByType(String typeCode);
}
