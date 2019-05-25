package com.cn.great.controller;


import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.req.user.TransferReq;
import com.cn.great.service.RelatedLotteryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: sport
 * @description: 彩票接口
 * @author: zach.M
 * @create: 2019-03-06 19:20
 **/
@RestController
@RequestMapping("/loto")
@Slf4j
public class RelatedLotteryController {
    @Autowired
    private RelatedLotteryService relatedLotteryService;

    /**
     * 登陆接口
     * @param request
     * @return
     * @throws Exception
     */
    @PostMapping("login")
    public ResponseEntity login(HttpServletRequest request) throws Exception {
        String userName=request.getSession().getAttribute(Constant.USER_NAME_SESSION)+"";
        String sessionId=relatedLotteryService.getLoginUrl(userName);
        return ResponseEntity.initGeneralResponseObj("登陆成功",sessionId);
    }

    /**
     * 获取余额接口
     * @param request
     * @return
     * @throws Exception
     */
    @PostMapping("getBalance")
    public ResponseEntity getBalance(HttpServletRequest request) throws Exception {
        String userName=request.getSession().getAttribute(Constant.USER_NAME_SESSION)+"";
        String balance=relatedLotteryService.getBalance(userName);
        return ResponseEntity.initGeneralResponseObj("获取余额成功",balance);
    }
    /**
     * 额度转换接口
     * @param request
     * @return
     * @throws Exception
     */
    @PostMapping(value = "transfer", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity transfer(@RequestBody @Valid TransferReq transferReq, HttpServletRequest request) throws Exception {
        String userName=request.getSession().getAttribute(Constant.USER_NAME_SESSION)+"";
        relatedLotteryService.transfer(userName,transferReq.getTransferType(),transferReq.getAmount());
        return ResponseEntity.initGeneralResponseMsg("余额转换成功");
    }
}
