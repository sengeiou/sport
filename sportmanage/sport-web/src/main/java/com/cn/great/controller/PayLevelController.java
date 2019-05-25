package com.cn.great.controller;


import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.pay.BankDataEntity;
import com.cn.great.model.pay.PayLevelEntity;
import com.cn.great.req.pay.BankDataReq;
import com.cn.great.req.pay.MapDataRep;
import com.cn.great.req.pay.PayLevelReq;
import com.cn.great.service.BankDataService;
import com.cn.great.service.PayLevelService;
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
@RequestMapping("payLevel")
@Slf4j
public class PayLevelController {

    @Resource
    private PayLevelService payLevelService;

    /**
     * @Description: 入款列表跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("payLevelPage")
    public String payInBankPage() {
        return "pay/pay_level_info";
    }

    /**
     *
     * @param payLevelReq
     * @return
     * @throws Exception
     */
    @PostMapping(value = "payLevelList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity payLevelList(@RequestBody PayLevelReq payLevelReq) throws Exception {
        List<PayLevelEntity> list = payLevelService.fetchList(payLevelReq);
        Integer recordsTotal = payLevelService.count(payLevelReq);
        return ResponseEntity.initGeneralResponseRes(list, recordsTotal);
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
        payLevelService.changeStatus(id);
        return ResponseEntity.initGeneralSuccessResponse();
    }
    /**
     *新增
     * @param payLevelEntity
     * @return
     * @throws GeneralException
     */
    @PostMapping(value="add", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity add(@RequestBody PayLevelEntity payLevelEntity) throws Exception {
        payLevelService.save(payLevelEntity);
        return ResponseEntity.initGeneralSuccessResponse();
    }
    /**
     *新增
     * @param payLevelEntity
     * @return
     * @throws GeneralException
     */
    @PostMapping(value="update", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity update(@RequestBody  PayLevelEntity payLevelEntity) throws Exception {
        payLevelService.update(payLevelEntity);
        return ResponseEntity.initGeneralSuccessResponse();
    }

}
