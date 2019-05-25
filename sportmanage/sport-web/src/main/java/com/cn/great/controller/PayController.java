package com.cn.great.controller;


import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.pay.PayInEntity;
import com.cn.great.model.pay.PayOutEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.pay.PayOutRep;
import com.cn.great.req.pay.PayReq;
import com.cn.great.service.PayService;
import com.cn.great.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @program: sport
 * @description: 资金类
 * @author: zach.M
 * @create: 2019-03-06 19:20
 **/
@Controller
@RequestMapping("pay")
@Slf4j
public class PayController {

    @Resource
    private PayService payService;
    @Resource
    private UserService userService;


    /**
     * @Description: 出款列表跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("offlinePayInPage")
    public String offlinePayInPage() {
        return "pay/offline_payin_info";
    }

    /**
     * @Description: 入款列表跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("payOutPage")
    public String payOutPage() {
        return "pay/payout_info";
    }
    /**
     *
     * @param payReq
     * @return
     * @throws GeneralException
     */
    @PostMapping(value = "offlinePayInList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity offlinePayInList(@RequestBody PayReq payReq) throws Exception {
        payReq.setType(2);// 2，线下
        if(StringUtils.isNotBlank(payReq.getUsername())){
            UserInfoEntity userInfoEntity=userService.fetchUserInfo(payReq.getUsername());
            payReq.setUserId(userInfoEntity.getId());
        }
        List<PayInEntity> payInEntities = payService.fetchPayInList(payReq);
        Integer recordsTotal = payService.countPayIn(payReq);
        return ResponseEntity.initGeneralResponseRes(payInEntities, recordsTotal);
    }
    /**
     *
     * @param id
     * @return
     * @throws GeneralException
     */
    @PostMapping(value="payInCheck/{id}")
    @ResponseBody
    public ResponseEntity payInCheck(@PathVariable("id") Integer id) throws Exception {
        payService.payInCheck(id);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
     *
     * @param pay
     * @return
     * @throws GeneralException
     */
    @PostMapping(value = "payOutList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity payOutList(@RequestBody PayReq pay) throws Exception {
        if(StringUtils.isNotBlank(pay.getUsername())){
            UserInfoEntity userInfoEntity=userService.fetchUserInfo(pay.getUsername());
            pay.setUserId(userInfoEntity.getId());
        }
        List<PayOutEntity> payInEntities = payService.fetchPayOutList(pay);
        Integer recordsTotal = payService.countPayOut(pay);
        return ResponseEntity.initGeneralResponseRes(payInEntities, recordsTotal);
    }
    /**
     *
     * @param userId
     * @return
     * @throws GeneralException
     */
    @PostMapping(value="payOutCountFlow/{userId}")
    @ResponseBody
    public ResponseEntity payOutCountFlow(@PathVariable("userId") Integer userId) throws Exception {
        PayOutRep map=payService.count4PayOut(userId);
        return ResponseEntity.initGeneralResponseObj("",map);
    }
    /**
     *
     * @param id
     * @return
     * @throws GeneralException
     */
    @PostMapping(value="updateStatus/{id}")
    @ResponseBody
    public ResponseEntity updateStatus(@PathVariable("id") Integer id,@RequestBody Integer toStatus ) throws Exception {
        payService.updateStatus(id,toStatus);
        return ResponseEntity.initGeneralSuccessResponse();
    }
}
