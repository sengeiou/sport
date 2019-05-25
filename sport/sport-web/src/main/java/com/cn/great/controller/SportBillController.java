package com.cn.great.controller;


import com.alibaba.fastjson.JSONObject;
import com.cn.great.annotations.SecurityParameter;
import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.match.BasketballQuotaEntity;
import com.cn.great.model.match.FootballQuotaEntity;
import com.cn.great.model.match.SportBillEntity;
import com.cn.great.model.match.SportHotEntity;
import com.cn.great.model.mongo.SportEntity;
import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.match.*;
import com.cn.great.service.SportBetService;
import com.cn.great.service.SportBillService;
import com.cn.great.service.UserService;
import com.cn.great.util.IPUtils;
import com.cn.great.util.RedisUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Collection;
import java.util.List;

import static com.cn.great.model.common.Constant.MENUE_CACHE_SALT;

/**
 *
 */
@RestController
@RequestMapping("/sport")
@CrossOrigin
@Slf4j
public class SportBillController {

    @Autowired
    private RedisUtil redisUtil;
    @Resource
    private SportBillService sportBillService;
    @Resource
    private UserService userService;
    @Autowired
    private SportBetService sportBetService;
    /**
     * 获取下注记录
     *
     * @param logReq
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/sportBetLog", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity sportBetLog(@RequestBody @Valid SportBetLogReq logReq, HttpServletRequest request) throws GeneralException {
        Integer pagelimit = logReq.getPagelimit();
        Integer page = logReq.getPage();
        Integer limit = logReq.getLimit();
        if (pagelimit == null || page == null || limit == null)
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.PARAMETER_CHECK_ERROR);
        if (pagelimit == 0) {  //pagelimit=0 分页
            log.info("分页limit=" + limit + ".........page=" + page);
            PageHelper.startPage(page, limit);
        } else {   //不分页  默认查10条
            log.info("默认取前10条..............");
            PageHelper.startPage(1, 10);
        }
        List<SportBillEntity> sportBillEntities = sportBillService.getSportBetLog(logReq);
        PageInfo<SportBillEntity> pageInfo = new PageInfo<>(sportBillEntities);
        return ResponseEntity.initGeneralResponseObj("查询成功", pageInfo.getList());
    }

    /**
     * 获取下注限额
     *
     * @param logReq
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/quotaConfig", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity quotaConfig(@RequestBody SportBetLogReq logReq, HttpServletRequest request) throws GeneralException {
        String type = logReq.getType();
        if (type == null || StringUtils.isEmpty(type))
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.PARAMETER_CHECK_ERROR);

        Object obj = redisUtil.get(type + Constant.QUOTA_CONFIG_CACHE_SALT);

        if (obj == null) {
            log.info("从缓存中获取下注限额失败，从数据库获取下注限额......");
            obj = sportBillService.getQuotaConfig(Integer.valueOf(type));
            if (obj instanceof BasketballQuotaEntity) {
                BasketballQuotaEntity basketball = (BasketballQuotaEntity) obj;
                redisUtil.set(type + Constant.QUOTA_CONFIG_CACHE_SALT, basketball);
                return ResponseEntity.initGeneralResponseObj("查询成功", basketball);
            } else {
                FootballQuotaEntity football = (FootballQuotaEntity) obj;
                redisUtil.set(type + Constant.QUOTA_CONFIG_CACHE_SALT, football);
                return ResponseEntity.initGeneralResponseObj("查询成功", football);
            }
        } else {
            log.info("从缓存中获取下注限额成功......");
            if (obj instanceof BasketballQuotaEntity) {
                BasketballQuotaEntity basketball = (BasketballQuotaEntity) obj;
                return ResponseEntity.initGeneralResponseObj("查询成功", basketball);
            } else {
                FootballQuotaEntity football = (FootballQuotaEntity) obj;
                return ResponseEntity.initGeneralResponseObj("查询成功", football);
            }
        }
    }

    /**
     * 下注(足球篮球)
     *
     * @param betsReq
     * @param request
     * @return
     * @throws GeneralException
     */
    @PostMapping(value = "/addBets", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity addBets(@RequestBody @Valid List<SportBetsReq> betsReq, HttpServletRequest request) throws Exception {
        String userName = request.getSession().getAttribute(Constant.USER_NAME_SESSION).toString();
        String ip= IPUtils.getRealIp(request, 0);
        JSONObject json=sportBetService.addBets(userName,betsReq,ip);
        return ResponseEntity.initGeneralResponseObj("", json);
    }
    /**
     * 下注(足球篮球)
     *
     * @param betsReq
     * @param request
     * @return
     * @throws GeneralException
     */
    @PostMapping(value = "/addBetOr", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity addBetOr(@RequestBody @Valid List<SportBetsReq> betsReq, HttpServletRequest request) throws Exception {
        String userName = request.getSession().getAttribute(Constant.USER_NAME_SESSION).toString();
        String ip= IPUtils.getRealIp(request, 0);
        JSONObject json=sportBetService.addOr(userName,betsReq,ip);
        return ResponseEntity.initGeneralResponseObj("", json);
    }
    /**
     * 下注(串串)
     *
     * @param mixBetsReq
     * @param request
     * @return
     * @throws GeneralException
     */
    @PostMapping(value = "/addp3", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity addp3(@RequestBody @Valid MixBetsReq mixBetsReq, HttpServletRequest request) throws Exception {
        String userName = request.getSession().getAttribute(Constant.USER_NAME_SESSION).toString();
        String ip= IPUtils.getRealIp(request, 0);
        JSONObject json=sportBetService.addp3(userName,mixBetsReq,ip);
        return ResponseEntity.initGeneralResponseObj("", json);
    }
    /**
     * add/del/show 收藏
     *
     * @param collectionReq
     * @param request
     * @return
     * @throws GeneralException
     * @throws ParseException
     */
    @SecurityParameter
    @PostMapping(value = "/collect", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity collect(@RequestBody @Valid CollectionReq collectionReq, HttpServletRequest request) throws GeneralException, ParseException {
        String userName = request.getSession().getAttribute(Constant.USER_NAME_SESSION).toString();
        if (userName.isEmpty()) throw GeneralException.initEnumGeneralException(ResponseCodeEnum.PARAMETER_CHECK_ERROR);
        MemberInfoEntity member = userService.getMemberInfo(String.valueOf(userName));
            if (member == null) {
                log.error("用户{}不存在", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
            }
        String result = sportBillService.collectSportMatch(collectionReq, member);
        log.info("收藏成功..............." + result);
        return ResponseEntity.initGeneralResponseObj("", result);
    }

    /**
     * 赛事导航
     * @param req
     * @param request
     * @return
     * @throws GeneralException
     * @throws ParseException
     */
    @PostMapping(value = "/category", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity category(@RequestBody @Valid MatchCategoryReq req, HttpServletRequest request) throws GeneralException, ParseException {
        Object obj = redisUtil.get(req.getPid()+MENUE_CACHE_SALT);
        String result;
        if(obj == null){
            log.info("category接口从缓存中获取赛事导航信息成功......");
            result = (String) obj;
        }else {
            log.info("从缓存中获取赛事导航信息成功......");
            result = sportBillService.getMatchCategory(req);
            redisUtil.set(req.getPid()+MENUE_CACHE_SALT,result);
        }
        return ResponseEntity.initGeneralResponseObj("", result);
    }

    /**
     * 赛事信息列表
     * @param req
     * @param request
     * @return
     * @throws GeneralException
     * @throws ParseException
     */
    @PostMapping(value = "/infomations", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity infomations(@RequestBody @Valid MatchReq req, HttpServletRequest request) throws GeneralException, ParseException {
        String result = sportBillService.getMatchInfomations(req);
        return ResponseEntity.initGeneralResponseObj("", result);
    }

    /**
     * 单场赛事信息
     * @param req
     * @param request
     * @return
     * @throws GeneralException
     * @throws ParseException
     */
    @PostMapping(value = "/infomation", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity infomation(@RequestBody @Valid MatchSingleReq req, HttpServletRequest request) throws GeneralException, ParseException {
        String result = sportBillService.getMatchInfomation(req);
        return ResponseEntity.initGeneralResponseObj("", result);
    }

    /**
     * 赛事直播
     * @param req
     * @param request
     * @return
     * @throws GeneralException
     * @throws ParseException
     */
    @PostMapping(value = "/live", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity live(@RequestBody @Valid MatchLiveReq req, HttpServletRequest request) throws GeneralException, ParseException {
        String result = sportBillService.getLiveData(req);
        return ResponseEntity.initGeneralResponseObj("", result);
    }
    /**
     * 联赛列表
     * @param req
     * @return
     */
    @PostMapping(value = "/listLeague", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity listLeague(@RequestBody @Valid SportReq req){
        List<SportRet> list=sportBillService.listLeague(req);
        return ResponseEntity.initGeneralResponseObj("获取赛事成功", list);
    }
    /**
     * 通用获取赛事信息
     * @param req
     * @return
     */
    @PostMapping(value = "/index", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity generalSportQuery(@RequestBody @Valid SportReq req){
        Object list=sportBillService.getSports(req);
        return ResponseEntity.initGeneralResponseObj("获取赛事成功", list);
    }
    /**
     * 首页赛事（现在获取的是正在直播的赛事）
     * @param req
     * @return
     */
    @PostMapping(value = "/home", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity homeSportQuery(@RequestBody @Valid SportReq req){
        JSONObject list=sportBillService.homeSportQuery(req);
        return ResponseEntity.initGeneralResponseObj("获取首页赛事成功", list);
    }
    /**
     * 赛事数量
     * @return
     */
    @GetMapping("/sportCount")
    @ResponseBody
    public ResponseEntity sportCount(){
        JSONObject jo=sportBillService.sportCount();
        return ResponseEntity.initGeneralResponseObj("获取赛事数量成功", jo);
    }
    /**
     * 冠军赛事
     * @return
     */
    @PostMapping(value = "/sportOrQuery", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity sportOrQuery(@RequestBody @Valid SportReq req){
        Collection<Championships> list=sportBillService.sportOrQuery(req);
        return ResponseEntity.initGeneralResponseObj("获取赛事数量成功", list);
    }

}
