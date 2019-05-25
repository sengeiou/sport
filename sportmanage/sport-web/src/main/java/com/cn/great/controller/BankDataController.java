package com.cn.great.controller;


import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.pay.BankDataEntity;
import com.cn.great.req.pay.BankDataReq;
import com.cn.great.req.pay.MapDataRep;
import com.cn.great.service.BankDataService;
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
@RequestMapping("bankData")
@Slf4j
public class BankDataController {

    @Resource
    private BankDataService bankDataService;

    /**
     * @Description: 入款列表跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("bankDataPage")
    public String payInBankPage() {
        return "pay/payin_bank_info";
    }
    @PostMapping(value = "bankDataList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity bankDataList(@RequestBody BankDataReq bankDataReq) throws Exception {
        List<BankDataEntity> notices = bankDataService.fetchList(bankDataReq);
        Integer recordsTotal = bankDataService.count(bankDataReq);
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
        bankDataService.changeStatus(id);
        return ResponseEntity.initGeneralSuccessResponse();
    }
    /**
     *新增
     * @param bankDataEntity
     * @return
     * @throws GeneralException
     */
    @PostMapping(value="add", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity add(@RequestBody BankDataEntity bankDataEntity) throws Exception {
        bankDataService.save(bankDataEntity);
        return ResponseEntity.initGeneralSuccessResponse();
    }
    /**
     *新增
     * @param bankDataEntity
     * @return
     * @throws GeneralException
     */
    @PostMapping(value="update", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity update(@RequestBody BankDataEntity bankDataEntity) throws Exception {
        bankDataService.update(bankDataEntity);
        return ResponseEntity.initGeneralSuccessResponse();
    }
    @GetMapping("getLevelData")
    @ResponseBody
    public ResponseEntity getLevelData() throws Exception {
        List<MapDataRep> list=bankDataService.getLevelData();
        return ResponseEntity.initGeneralResponseObj("",list);
    }
    @GetMapping("getPayTypeData")
    @ResponseBody
    public ResponseEntity getPayTypeData() throws Exception {
        List<MapDataRep> list=bankDataService.getPayTypeData();
        return ResponseEntity.initGeneralResponseObj("",list);
    }
    @GetMapping("getPayBankData")
    @ResponseBody
    public ResponseEntity getPayBankData() throws Exception {
        List<MapDataRep> list=bankDataService.getPayBankData();
        return ResponseEntity.initGeneralResponseObj("",list);
    }
}
