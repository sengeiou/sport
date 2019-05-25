package com.cn.great.controller;


import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.req.user.AgLoginReq;
import com.cn.great.req.user.AgTransferReq;
import com.cn.great.req.user.MgLoginReq;
import com.cn.great.service.ThirdPartyGamesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: sport
 * @description: AG和MG等第三方接口
 * @author: zach.M
 * @create: 2019-03-06 19:20
 **/
@RestController
@RequestMapping("/thirdPartyGames")
@Slf4j
public class ThirdPartyGamesController {
    @Autowired
    private ThirdPartyGamesService thirdPartyGamesService;

    /**
     * 注册接口
     * @param request
     * @return
     * @throws Exception
     */
    @GetMapping("agReg")
    public ResponseEntity agReg(HttpServletRequest request) throws Exception {
        String userName=request.getSession().getAttribute(Constant.USER_NAME_SESSION)+"";
        thirdPartyGamesService.agRegister(userName);
        return ResponseEntity.initGeneralResponseMsg("注册AG成功");
    }
    /**
     * 注册接口
     * @param request
     * @return
     * @throws Exception
     */
    @GetMapping("agLogin")
    public ResponseEntity agLogin(@RequestBody @Valid AgLoginReq agLoginReq, HttpServletRequest request) throws Exception {
        String userName=request.getSession().getAttribute(Constant.USER_NAME_SESSION)+"";
        agLoginReq.setDm(request.getHeader("Referer"));
        String url=thirdPartyGamesService.agLogin(userName,agLoginReq);
        return ResponseEntity.initGeneralResponseObj("成功获取AG跳转地址",url);
    }

    /**
     * 获取余额接口
     * @param request
     * @return
     * @throws Exception
     */
    @GetMapping("getAgMoney")
    public ResponseEntity getAgBalance(HttpServletRequest request) throws Exception {
        String userName=request.getSession().getAttribute(Constant.USER_NAME_SESSION)+"";
        String balance= thirdPartyGamesService.getAgBalance(userName);
        return ResponseEntity.initGeneralResponseObj("获取余额成功",balance);
    }
    /**
     * 额度转换接口
     * @param request
     * @return
     * @throws Exception
     */
    @PostMapping(value = "agTransfer", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity agTransfer(@RequestBody @Valid AgTransferReq transferReq, HttpServletRequest request) throws Exception {
        String userName=request.getSession().getAttribute(Constant.USER_NAME_SESSION)+"";
        thirdPartyGamesService.agTransfer(userName,transferReq.getType(),transferReq.getAmount());
        return ResponseEntity.initGeneralResponseMsg("AG额度转换成功");
    }

    /**
     * MG注册接口
     * @param request
     * @return
     * @throws Exception
     */
    @GetMapping("mgReg")
    public ResponseEntity mgReg(HttpServletRequest request) throws Exception {
        String userName=request.getSession().getAttribute(Constant.USER_NAME_SESSION)+"";
        thirdPartyGamesService.mgRegister(userName);
        return ResponseEntity.initGeneralResponseMsg("MG账户激活成功");
    }
    /**
     * MG登陆接口
     * @param request
     * @return
     * @throws Exception
     */
    @PostMapping(value="mgLogin", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity mgLogin(@RequestBody @Valid MgLoginReq mgLoginReq, HttpServletRequest request) throws Exception {
        String userName=request.getSession().getAttribute(Constant.USER_NAME_SESSION)+"";
        String url=thirdPartyGamesService.mgLogin(userName,mgLoginReq);
        return ResponseEntity.initGeneralResponseObj("登陆MG成功",url);
    }
    /**
     * 获取MG游戏列表
     * @param terminal
     * @return
     * @throws Exception
     */
    @GetMapping("mgGameList")
    public ResponseEntity mgGameList(@Valid String terminal) throws Exception {
        List<Map<String,Object>> list=thirdPartyGamesService.mgGameList(terminal);
        return ResponseEntity.initGeneralResponseObj("成功获取MG游戏列表",list);
    }
    /**
     * 获取MG余额接口
     * @param request
     * @return
     * @throws Exception
     */
    @GetMapping("getMgMoney")
    public ResponseEntity getMgBalance(HttpServletRequest request) throws Exception {
        String userName=request.getSession().getAttribute(Constant.USER_NAME_SESSION)+"";
        String balance= thirdPartyGamesService.getMgBalance(userName);
        return ResponseEntity.initGeneralResponseObj("获取余额成功",balance);
    }
    /**
     * MG余额接口
     * @param request
     * @return
     * @throws Exception
     */
    @GetMapping(value="mgTransfer",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity mgTransfer(@RequestBody @Valid AgTransferReq transferReq,HttpServletRequest request) throws Exception {
        String userName=request.getSession().getAttribute(Constant.USER_NAME_SESSION)+"";
        thirdPartyGamesService.mgTransfer(userName,transferReq.getType(),transferReq.getAmount());
        return ResponseEntity.initGeneralResponseMsg("额度转换成功");
    }

}
