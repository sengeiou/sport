package com.cn.great.controller;

import com.cn.great.exception.GeneralException;
import com.cn.great.model.bill.AgBill;
import com.cn.great.model.bill.LotteryBill;
import com.cn.great.model.bill.MgBill;
import com.cn.great.model.bill.SportBillEntity;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.system.DictEntity;
import com.cn.great.req.bill.AGBillReq;
import com.cn.great.req.bill.LotteryBillReq;
import com.cn.great.req.bill.MGBillReq;
import com.cn.great.req.bill.SportBillReq;
import com.cn.great.service.BillService;
import com.cn.great.util.CommonMethodUtils;
import com.cn.great.util.DateUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: agentmanage
 * @description: 注单查询
 * @author: Stamp
 * @create: 2019-05-19 14:56
 **/
@Controller
@RequestMapping("bill")
@Slf4j
public class BillController {

    @Resource
    private BillService billService;

    /**
     * @Description: MG电子注单查询
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/19
     */
    @RequestMapping("mgPage")
    public String mgPage(HttpServletRequest request) {
        return "bill/mgbill";
    }

    /**
     * @Description: MG电子注单查询
     * @Param: [mgBillReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/19
     */
    @PostMapping(value = "mgBills", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity mgBills(@RequestBody MGBillReq mgBillReq, HttpServletRequest request) throws GeneralException {

        mgBillReq.setStartTime(DateUtils.dateCheckTimeStamp(mgBillReq.getBeginTime()));
        mgBillReq.setFinalTime(DateUtils.dateCheckTimeStamp(mgBillReq.getEndTime()));
        List<MgBill> mgBills = billService.fetchMgList(mgBillReq);
        String totals = billService.countMGBill(mgBillReq);
        Integer recordsTotal = 0;
        if (!CollectionUtils.isEmpty(mgBills)) {
            recordsTotal = CommonMethodUtils.initResObj(mgBills.get(0), MgBill.class, totals);
        }
        return ResponseEntity.initGeneralResponseRes(mgBills, recordsTotal);
    }

    /**
     * @Description: ag电子XIN注单页面跳转
     * @Param: [request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/20
     */
    @RequestMapping("agXinPage")
    public String agXinPage(HttpServletRequest request) {
        return "bill/agxinbill";
    }

    /**
     * @Description: AG捕鱼注单页面跳转
     * @Param: [request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/21
     */
    @RequestMapping("agFishPage")
    public String agFishPage(HttpServletRequest request) {
        return "bill/agfishbill";
    }

    /**
     * @Description: AG电子YOPLAY页面跳转
     * @Param: [request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/21
     */
    @RequestMapping("agYoPlayPage")
    public String agYoPlayPage(HttpServletRequest request) {
        return "bill/agyoplaybill";
    }

    /**
     * @Description: 真人荷官注单查询
     * @Param: [request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/20
     */
    @RequestMapping("realPage")
    public String realPage(HttpServletRequest request) {
        return "bill/realbill";
    }


    /**
     * @Description: 真人注单查询
     * @Param: [agBillReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/21
     */
    @PostMapping(value = "realBills", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity realBills(@RequestBody AGBillReq agBillReq, HttpServletRequest request) throws GeneralException {

        List<AgBill> agBills = billService.fetchAgList(agBillReq);
        String totals = billService.countAGBill(agBillReq);
        Integer recordsTotal = 0;
        if (!CollectionUtils.isEmpty(agBills)) {
            recordsTotal = CommonMethodUtils.initResObj(agBills.get(0), AgBill.class, totals);
        }
        return ResponseEntity.initGeneralResponseRes(agBills, recordsTotal);
    }

    /**
     * @Description: 彩票注单页面跳转
     * @Param: [request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/21
     */
    @RequestMapping("lotteryPage")
    public String lotteryPage(HttpServletRequest request) {
        return "bill/lotterybill";
    }


    /**
     * @Description: 彩票注单查询
     * @Param: [lotteryBillReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/21
     */
    @PostMapping(value = "lotteryBills", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity lotteryBills(@RequestBody LotteryBillReq lotteryBillReq, HttpServletRequest request) throws GeneralException {

        List<LotteryBill> lotteryBills = billService.fetchLotteryList(lotteryBillReq);
        String totals = billService.countLotteryBill(lotteryBillReq);
        Integer recordsTotal = 0;
        if (!CollectionUtils.isEmpty(lotteryBills)) {
            recordsTotal = CommonMethodUtils.initResObj(lotteryBills.get(0), LotteryBill.class, totals);
        }
        return ResponseEntity.initGeneralResponseRes(lotteryBills, recordsTotal);
    }

    /**
     * @Description: 体育赛事注单查询
     * @Param: [request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/21
     */
    @RequestMapping("sportPage")
    public String sportPage(Model model, HttpServletRequest request) {
        // 获取所有的球赛类型
        List<DictEntity> ballTypes = billService.fetchEnumsByType("ball_type");
        model.addAttribute("ballTypes", ballTypes);
        // 获取所有的玩法类型
        List<DictEntity> playTypes = billService.fetchEnumsByType("play_type_ball");
        model.addAttribute("playTypes", playTypes);
        request.getSession().setAttribute(Constant.PLAY_BALL_TYPE_SESSION, playTypes);
        // 获取所有的注单确认
        List<DictEntity> billConfirmeTypes = billService.fetchEnumsByType("bill_confirme_type");
        model.addAttribute("billConfirmeTypes", billConfirmeTypes);
        request.getSession().setAttribute(Constant.BILL_CONFIRMED_SESSION, billConfirmeTypes);
        return "bill/sportbill";
    }


    /**
     * @Description: 获取玩法类型
     * @Param: [request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/25
     */
    @PostMapping(value = "playTypes", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity playTypes(HttpServletRequest request) throws GeneralException {
        List<DictEntity> playTypes = new ArrayList<>();
        Object obj = request.getSession().getAttribute(Constant.PLAY_BALL_TYPE_SESSION);
        if (obj != null) {
            playTypes.addAll((List<DictEntity>) obj);
        }
        return ResponseEntity.initGeneralResponseRes(playTypes, playTypes.size());
    }

    /**
     * @Description: 获取所有的注单确认
     * @Param: [request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/25
     */
    @PostMapping(value = "billConfirmeTypes", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity billConfirmeTypes(HttpServletRequest request) throws GeneralException {
        List<DictEntity> billConfirmeTypes = new ArrayList<>();
        Object obj = request.getSession().getAttribute(Constant.BILL_CONFIRMED_SESSION);
        if (obj != null) {
            billConfirmeTypes.addAll((List<DictEntity>) obj);
        }
        return ResponseEntity.initGeneralResponseRes(billConfirmeTypes, billConfirmeTypes.size());
    }

    /** 
    * @Description: 球赛注单查询
    * @Param: [sportBillReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/5/25 
    */
    @PostMapping(value = "sportBills", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity sportBills(@RequestBody SportBillReq sportBillReq, HttpServletRequest request) throws GeneralException {

        List<SportBillEntity> sportBillEntities = billService.fetchSportList(sportBillReq);
        String totals = billService.countSportBill(sportBillReq);
        Integer recordsTotal = 0;
        if (!CollectionUtils.isEmpty(sportBillEntities)) {
            recordsTotal = CommonMethodUtils.initResObj(sportBillEntities.get(0), SportBillEntity.class, totals);
        }

        return ResponseEntity.initGeneralResponseRes(sportBillEntities, recordsTotal);
    }

    /**
     * @Description: 体育赛事审核
     * @Param: [sportBillReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/24
     */
    @PostMapping(value = "audit", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity audit(@RequestBody SportBillReq sportBillReq, HttpServletRequest request) throws GeneralException {
        return ResponseEntity.initGeneralSuccessResponse();
    }

}
