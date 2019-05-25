package com.cn.great.controller;


import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.pay.BankDataEntity;
import com.cn.great.model.pay.PayLevelEntity;
import com.cn.great.model.pay.PaymentDataEntity;
import com.cn.great.req.pay.PayLevelReq;
import com.cn.great.req.pay.PaymentReq;
import com.cn.great.service.PayLevelService;
import com.cn.great.service.PaymentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: sport
 * @description: 资金类
 * @author: zach.M
 * @create: 2019-03-06 19:20
 **/
@Controller
@RequestMapping("payment")
@Slf4j
public class PaymentController {

    @Resource
    private PaymentService paymentService;

    /**
     * @Description: 入款列表跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("paymentPage")
    public String payInBankPage() {
        return "pay/payment_info";
    }

    /**
     *
     * @param paymentReq
     * @return
     * @throws Exception
     */
    @PostMapping(value = "paymentList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity bankDataList(@RequestBody PaymentReq paymentReq) throws Exception {
        List<PaymentDataEntity> notices = paymentService.fetchList(paymentReq);
        Integer recordsTotal = paymentService.count(paymentReq);
        return ResponseEntity.initGeneralResponseRes(notices, recordsTotal);
    }
    /**
     *
     * @param id
     * @return
     * @throws GeneralException
     */
    @PostMapping("changeStatus/{id}")
    @ResponseBody
    public ResponseEntity delete(@PathVariable("id") Integer id) throws Exception {
        paymentService.changeStatus(id);
        return ResponseEntity.initGeneralSuccessResponse();
    }
    /**
     *新增
     * @param paymentDataEntity
     * @return
     * @throws GeneralException
     */
    @PostMapping(value="add", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity add(@RequestBody PaymentDataEntity paymentDataEntity) throws Exception {
        paymentService.save(paymentDataEntity);
        return ResponseEntity.initGeneralSuccessResponse();
    }
    /**
     *新增
     * @param paymentDataEntity
     * @return
     * @throws GeneralException
     */
    @PostMapping(value="update", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity update(@RequestBody   PaymentDataEntity paymentDataEntity) throws Exception {
        paymentService.update(paymentDataEntity);
        return ResponseEntity.initGeneralSuccessResponse();
    }

}
