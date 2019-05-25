package com.cn.great.service;

import com.alibaba.fastjson.JSONObject;
import com.cn.great.model.match.SportBillEntity;
import com.cn.great.model.match.SportHotEntity;
import com.cn.great.model.mongo.SportEntity;
import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.match.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.text.ParseException;
import java.util.Collection;
import java.util.List;


public interface SportBillService {

    /**
     * 查询下注记录
     * @param req
     * @return
     */
    List<SportBillEntity> getSportBetLog(SportBetLogReq req);

    /**
     * 查询下注限额
     * @param type
     * @return
     */
    Object getQuotaConfig(Integer type);

    /**
     * 根据赛事ID，联赛ID查询联赛信息
     * @param mid
     * @param mLeagueId
     * @return
     */
    List<SportHotEntity> getSportHotById(int mid, int mLeagueId);

    /**
     * 下注
     * @param sportBets
     * @param sportHot
     * @param user
     * @param request
     * @return
     */
    void addBet(SportBetsReq sportBets,SportHotEntity sportHot, UserInfoEntity user, HttpServletRequest request) throws ParseException;

    /**
     *  收藏赛事
     * @param collectionReq
     * @param memberInfo
     * @return
     */
    String collectSportMatch(CollectionReq collectionReq, MemberInfoEntity memberInfo);

    /**
     * 获取赛事分类
     * @param req
     * @return
     */
    String getMatchCategory(MatchCategoryReq req);

    /**
     * 获取赛事信息
     * @param req
     * @return
     */
    String getMatchInfomations(MatchReq req);

    /**
     * 获取单场赛事信息
     * @param req
     * @return
     */
    String getMatchInfomation(MatchSingleReq req);

    /**
     * 获取直播数据
     * @param req
     * @return
     */
    String getLiveData(MatchLiveReq req);

    /**
     * @param req
     * @return
     */
    Collection<SportEntity> getSports(@Valid SportReq req);

    /**
     * 获取首页数据
     * @param req
     * @return
     */
    JSONObject homeSportQuery(@Valid SportReq req);

    /**
     * 获取数量汇总
     * @return
     */
    JSONObject sportCount();

    /**
     * 冠军赛事查询
     * @return
     * @param req
     */
    Collection<Championships> sportOrQuery(SportReq req);

    /**
     * 联赛查询
     * @param req
     * @return
     */
    List<SportRet> listLeague(@Valid SportReq req);
}
