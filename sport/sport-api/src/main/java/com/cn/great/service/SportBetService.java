package com.cn.great.service;

import com.alibaba.fastjson.JSONObject;
import com.cn.great.model.match.SportBillEntity;
import com.cn.great.model.match.SportHotEntity;
import com.cn.great.model.mongo.SportEntity;
import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.req.match.*;

import javax.validation.Valid;
import java.util.Collection;
import java.util.List;

/**
 * 下注方法独立出来
 */

public interface SportBetService {
    /**
     * 下注接口
     * @param userName
     * @param betsReq
     * @param ip
     * @return
     */
    JSONObject addBets(String userName, @Valid List<SportBetsReq> betsReq, String ip) throws Exception;

    /**
     * 冠军下注接口
     * @param userName
     * @param betsReq
     * @param ip
     * @return
     */
    JSONObject addOr(String userName, @Valid List<SportBetsReq> betsReq, String ip) throws Exception;

    /**
     * 串串下注
     * @param userName
     * @param mixBetsReq
     * @param ip
     * @return
     */
    JSONObject addp3(String userName, @Valid MixBetsReq mixBetsReq, String ip) throws Exception;
}
