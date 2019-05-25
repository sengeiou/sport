package com.cn.great.service;

import com.alibaba.fastjson.JSONObject;

import java.io.IOException;
import java.math.BigDecimal;

/**
 * @Description: 彩票接口service
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */

public interface RelatedLotteryService {

    //登陆接口
    JSONObject login(String userName) throws IOException;

    /**
     * 获取登陆url
     * @param userName
     * @return
     */
    String getLoginUrl(String userName) throws Exception;

    /**
     * 获取余额
     * @param userName
     * @return
     */
    String getBalance(String userName) throws IOException;

    /**
     * 额度转换
     * @param userName
     * @param amount
     * @return
     */
    void transfer(String userName, String transferType, BigDecimal amount) throws IOException;
}
