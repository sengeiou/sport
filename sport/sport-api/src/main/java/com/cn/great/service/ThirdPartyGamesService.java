package com.cn.great.service;

import com.cn.great.req.user.AgLoginReq;
import com.cn.great.req.user.MgLoginReq;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * @Description: 彩票接口service
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */

public interface ThirdPartyGamesService {
    /**
     * 注册ag
     * @param userName
     */
    void agRegister(String userName);

    /**
     * 登陆AG
     * @param userName
     * @param agLoginReq
     */
    String agLogin(String userName, AgLoginReq agLoginReq);

    /**
     * 获取ag余额
     * @param userName
     * @return
     */
    String getAgBalance(String userName);

    /**
     *
     * @param userName
     * @param type
     * @param amount
     */
    void agTransfer(String userName,  String type, BigDecimal amount);

    /**
     * mg注册
     * @param userName
     */
    void mgRegister(String userName);

    /**
     * ag登陆
     * @param userName
     * @param mgLoginReq
     */
    String  mgLogin(String userName, MgLoginReq mgLoginReq);

    /**
     * 获取游戏列表
     * @param terminal
     * @return
     */
    List<Map<String,Object>> mgGameList(String terminal);

    /**
     * 获取MG余额
     * @param userName
     * @return
     */
    String getMgBalance(String userName);

    /**
     * mg额度转换成功
     * @param userName
     * @param type
     * @param amount
     */
    void mgTransfer(String userName, @NotBlank String type, @NotNull BigDecimal amount);
}
