package com.cn.great.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.mapper.sportbill.SportBillMapper;
import com.cn.great.model.common.Constant;
import com.cn.great.model.match.SportBillEntity;
import com.cn.great.model.match.SportMixBillEntity;
import com.cn.great.model.mongo.SportEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.match.*;
import com.cn.great.service.SportBetService;
import com.cn.great.service.UserService;
import com.cn.great.util.DateUtils;
import com.cn.great.util.IdGens;
import com.cn.great.util.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.util.*;


/**
 * 体育注单Service
 */
@Service
@Slf4j
public class SportBetServiceImpl implements SportBetService {

    @Autowired
    private SportBillMapper sportBillMapper;


    @Autowired
    private MongoTemplate mongoTemplate;

    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private UserService userService;

    public static final IdGens idGen = IdGens.get();

    public SportEntity getSportById(@NotNull Integer mid, @NotNull Integer mleagueid,String... keys) throws Exception {
        Object obj=null;
        SportEntity entity=null;
        for(String key:keys){
            obj=redisUtil.hget(Constant.SPORT_LIST_SALT,key);
            if(obj!=null){
                List<SportEntity> list=(List) obj;
                entity=list.stream().filter(p->p.getMid().equals(mid)&&p.getMleagueid().equals(mleagueid)).findFirst().get();
                if(entity!=null){
                    break;
                }
            }
        }
        //redis里面拿取
        if(obj==null){
            //拿不到的话从mongoDb里面获取
            Query query = new Query();
            query.addCriteria(Criteria.where("mid").is(mid).and("mleagueid").is(mleagueid));
            query.with(new Sort(Sort.Direction.DESC, "deletimes ")).limit(1);
            entity=mongoTemplate.findOne(query,SportEntity.class);
        }
        return entity;
    }
    @Transactional
    @Override
    public JSONObject addBets(String userName, @Valid List<SportBetsReq> betsReq, String ip) throws Exception {
        JSONObject success=new JSONObject();
        JSONObject fail=new JSONObject();
        UserInfoEntity user = userService.fetchUserInfo(userName);
        //一单单校验，成功与失败的单互不影响
        for(SportBetsReq req:betsReq){
            JSONObject jo=addBet(user,req,ip);
            if(jo.size()==2){
                fail.put(req.getOddsid(),jo);
            }else{
                success.put(req.getOddsid(),jo);
            }

        }
        JSONObject ret=new JSONObject();
        ret.put("successList",success);
        ret.put("failList",fail);
        return ret;
    }


    private JSONObject addBet(UserInfoEntity user, SportBetsReq req, String ip) throws Exception {
        JSONObject ret=new JSONObject();
        //获取赛事信息
        SportEntity entity=getSportById(req.getMid(),req.getMleagueid(),req.getMtype()+req.getType());


        //校验
        String msg= betValid(user, req,entity);
        if(StringUtils.isNotBlank(msg)){
            ret.put("error_msg",msg);
            ret.put("error_code",7001);
            return ret;
        }
        Integer id=saveBill(user,req,entity,ip);
        ret.put("oddid",req.getOddsid());
        ret.put("mrate",req.getOddsv());
        ret.put("orderid",id);
        return ret;
    }

    private  Integer saveBill(UserInfoEntity user, SportBetsReq sportBets, SportEntity sportEntity, String ip) throws Exception {
        String bettime = DateUtils.getDateTime();
        String orderNo=user.getId()+""+ idGen.nextId();
        SportBillEntity sportBill = SportBillEntity.builder()
                .orderNo(orderNo)
                .mPlace(sportBets.getOddsNv())
                .userId(user.getId())
                .userName(user.getUserName())
                .mid(sportBets.getMid())
                .mLeagueId(sportBets.getMleagueid())
                .mType(sportBets.getMtype())
                .bettime(DateUtils.dateCheckTimeStamp(bettime))
                .gold(new BigDecimal(sportBets.getBetFormAmount()))
                .mDate(DateUtils.timeStampCheckDate(sportEntity.getDatetimes()))
                .mRate(new BigDecimal(sportBets.getOddsv()))
                .gwin(new BigDecimal(sportBets.getBetFormAmount()).multiply(new BigDecimal(sportBets.getOddsv())))
                .showType(sportBets.getBetFormType())
                .gType(sportBets.getSportType())
                .score1(sportEntity.getScore1())
                .score2(sportEntity.getScore2())
                .lastBetMoney(user.getMoney())
                .afterBetCredit(user.getMoney().subtract(new BigDecimal(sportBets.getBetFormAmount())))
                .agentId(user.getAgentId())
                .betIp(ip)
                .cancel(0)
                .type(sportBets.getFglgtype())
                .mbBall(0)
                .tgBall(0)
                .checked(0)
                .confirmed(0)
                .danger(0)
                .pType(sportBets.getType())
                .mLeagueName(sportEntity.getMleague())
                .eventName(sportEntity.getMbteam()+" VS " +sportEntity.getTgteam())
                .serverAdmin(user.getServerAdmin()).build();
        Integer id = sportBillMapper.addBet(sportBill); //记录投注注单
        if (id == null) {
            log.info("添加注单失败.................");
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.BET_FAILURE_ERROR);
        }
        BigDecimal betFormAmount = new BigDecimal(sportBets.getBetFormAmount()).negate();
        userService.updateBalance(user.getId(),betFormAmount,"下注",id);
        return id;
    }

    private String  betValid(UserInfoEntity user, SportBetsReq req, SportEntity sportEntity) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        String msg;
        //校验余额是不是足够
        BigDecimal balence = new BigDecimal(req.getBetFormAmount());
        //账户余额不足
        if (user.getMoney().compareTo(balence) == -1) {
            msg="账户余额不足";
            return msg;
        }
        //获取赛事数据
        if(sportEntity==null){
            msg="赛事已过期";
            return msg;
        }
        //校验这个投注的赔率
        String typeJson=BeanUtils.getPropertyDescriptor(sportEntity.getClass(),req.getType()).getReadMethod().invoke(sportEntity)+"";
        JSONObject typejo=JSONObject.parseObject(typeJson);
        //获取赔率
        BigDecimal oddNum=typejo.getBigDecimal(req.getOddsid());
        if(oddNum==null||oddNum.compareTo(new BigDecimal(req.getOddsv()))>0){
            msg="赔率已过期";
            return msg;
        }
        return null;
    }
    @Transactional
    @Override
    public JSONObject addOr(String userName, @Valid List<SportBetsReq> betsReq, String ip) throws Exception {
        JSONObject success=new JSONObject();
        JSONObject fail=new JSONObject();
        UserInfoEntity user = userService.fetchUserInfo(userName);
        //一单单校验，成功与失败的单互不影响
        for(SportBetsReq req:betsReq){
            JSONObject jo=addBetOr(user,req,ip);
            if(jo.size()==2){
                fail.put(req.getOddsid(),jo);
            }else{
                success.put(req.getOddsid(),jo);
            }

        }
        JSONObject ret=new JSONObject();
        ret.put("successList",success);
        ret.put("failList",fail);
        return ret;
    }


    private JSONObject addBetOr(UserInfoEntity user, SportBetsReq req, String ip) throws Exception {
        JSONObject ret=new JSONObject();
        //获取赛事信息
        Championships entity=getSportOrById(req.getMid(),req.getMleagueid());


        //校验
        String msg= betOrValid(user, req,entity);
        if(StringUtils.isNotBlank(msg)){
            ret.put("error_msg",msg);
            ret.put("error_code",7001);
            return ret;
        }
        Integer id=saveOrBill(user,req,entity,ip);
        ret.put("oddid",req.getOddsid());
        ret.put("mrate",req.getOddsv());
        ret.put("orderid",id);
        return ret;
    }
    public Championships getSportOrById(@NotNull Integer mid, @NotNull Integer mleagueid) throws Exception {
        Object obj=redisUtil.get(Constant.SPORT_OR_LIST_SALT);
        Championships entity;
        //redis里面拿取
        if(obj!=null){
            List<Championships> list=(List) obj;
            entity=list.stream().filter(p->p.getMid().equals(mid)&&p.getMleagueid().equals(mleagueid)).findFirst().get();
        }else{ //拿不到的话从mongoDb里面获取
            Query query = new Query();
            query.addCriteria(Criteria.where("mid").is(mid).and("mleagueid").is(mleagueid));
            query.with(new Sort(Sort.Direction.DESC, "deletimes ")).limit(1);
            entity=mongoTemplate.findOne(query,Championships.class);
        }
        return entity;
    }
    private String  betOrValid(UserInfoEntity user, SportBetsReq req, Championships championships) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        String msg;
        //校验余额是不是足够
        BigDecimal balence = new BigDecimal(req.getBetFormAmount());
        //账户余额不足
        if (user.getMoney().compareTo(balence) == -1) {
            msg="账户余额不足";
            return msg;
        }
        //获取赛事数据
        if(championships==null){
            msg="赛事已过期";
            return msg;
        }
        //校验这个投注的赔率
        JSONObject typejo=JSONArray.parseArray(championships.getValue()).getJSONObject(0);
        //获取赔率
        JSONArray ja=typejo.getJSONArray("o");
        BigDecimal oddNum=null;
       for(int i=0;i<ja.size();i++){
            JSONArray cja=ja.getJSONArray(i);
            if(cja.size()==3&&cja.getString(1).equals(req.getOddsid())){
                oddNum=cja.getBigDecimal(2);
                break;
            }
       }
        if(oddNum==null||oddNum.compareTo(new BigDecimal(req.getOddsv()))>0){
            msg="赔率已过期";
            return msg;
        }
        return null;
    }


    private Integer saveOrBill(UserInfoEntity user, SportBetsReq sportBets, Championships championships, String ip) throws ParseException {

        String bettime = DateUtils.getDateTime();
        String orderNo=user.getId()+""+idGen.nextId();
        SportBillEntity sportBill = SportBillEntity.builder()
                .orderNo(orderNo)
                .mPlace(sportBets.getBetFormDetail())
                .userId(user.getId())
                .userName(user.getUserName())
                .mid(sportBets.getMid())
                .mLeagueId(sportBets.getMleagueid())
                .mType(sportBets.getMtype())
                .bettime(DateUtils.dateCheckTimeStamp(bettime))
                .gold(new BigDecimal(sportBets.getBetFormAmount()))
                .mDate(DateUtils.timeStampCheckDate(championships.getDatetimes()))
                .mRate(new BigDecimal(sportBets.getOddsv()))
                .gwin(new BigDecimal(sportBets.getBetFormAmount()).multiply(new BigDecimal(sportBets.getOddsv())))
                .showType(sportBets.getBetFormType())
                .gType(sportBets.getSportType())
                .score1("0")
                .score2("0")
                .lastBetMoney(user.getMoney())
                .afterBetCredit(user.getMoney().subtract(new BigDecimal(sportBets.getBetFormAmount())))
                .agentId(user.getAgentId())
                .betIp(ip)
                .cancel(0)
                .type("0")
                .mbBall(0)
                .tgBall(0)
                .checked(0)
                .confirmed(0)
                .danger(0)
                .pType(sportBets.getType())
                .mLeagueName(championships.getMleague())
                .eventName(championships.getEgn())
                .serverAdmin(user.getServerAdmin()).build();
        Integer id = sportBillMapper.addBet(sportBill); //记录投注注单
        if (id == null) {
            log.info("添加注单失败.................");
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.BET_FAILURE_ERROR);
        }
        BigDecimal betFormAmount = new BigDecimal(sportBets.getBetFormAmount()).negate();
        userService.updateBalance(user.getId(),betFormAmount,"下注",id);
        user.setMoney(user.getMoney().add(betFormAmount));//重置用户金额
        return id;
    }
    @Transactional
    @Override
    public JSONObject addp3(String userName, @Valid MixBetsReq mixBetsReq, String ip) throws Exception{
        JSONObject ret=new JSONObject();
        //获取用户信息
        UserInfoEntity user = userService.fetchUserInfo(userName);
        //校验
        String msg= betMixValid(user, mixBetsReq);
        if(StringUtils.isNotBlank(msg)){
           throw GeneralException.initEnumGeneralException(2045,msg);
        }
        Integer id=saveMixBill(user,mixBetsReq,ip);
        ret.put("orderid",id);
        return ret;
    }

    private Integer saveMixBill(UserInfoEntity user, @Valid MixBetsReq mixBetsReq, String ip) throws Exception {
        String bettime = DateUtils.getDateTime();
        String orderNo=user.getId()+""+idGen.nextId();
        SportBillEntity sportBill = SportBillEntity.builder()
                .orderNo(orderNo)
                .userId(user.getId())
                .userName(user.getUserName())
                .bettime(DateUtils.dateCheckTimeStamp(bettime))
                .gold(mixBetsReq.getBetFormAmount())
                .mRate(mixBetsReq.getMrate())
                .gwin(mixBetsReq.getWinableAmount())
                .score1("0")
                .score2("0")
                .lastBetMoney(user.getMoney())
                .afterBetCredit(user.getMoney().subtract(mixBetsReq.getBetFormAmount()))
                .agentId(user.getAgentId())
                .betIp(ip)
                .cancel(0)
                .type("0")
                .mbBall(0)
                .tgBall(0)
                .checked(0)
                .confirmed(0)
                .danger(0)
                .serverAdmin(user.getServerAdmin()).build();
        Integer id = sportBillMapper.addBet(sportBill); //记录投注注单
        if (id == null) {
            log.info("添加注单失败.................");
            GeneralException.initEnumGeneralException(ResponseCodeEnum.BET_FAILURE_ERROR);
        }
        List<SportMixBillEntity> sportBillMixEntities=new ArrayList<>();
        for(SportBetsReq sportBetsReq:mixBetsReq.getBetVal()){
            SportEntity sportEntity=getSportById(sportBetsReq.getMid(),sportBetsReq.getMleagueid(),"r"+sportBetsReq.getType(),"rb"+sportBetsReq.getType());

            SportMixBillEntity entity=new SportMixBillEntity();
            entity.setOrderNo(orderNo);
            entity.setMDate(sportEntity.getDatetimes());
            entity.setMLeagueName(sportEntity.getMleague());
            entity.setEventName(sportEntity.getMbteam()+" VS "+sportEntity.getTgteam());
            entity.setMid(sportBetsReq.getMid());
            entity.setMLeagueId(sportBetsReq.getMleagueid());
            entity.setGType(sportBetsReq.getSportType());
            entity.setMType(sportBetsReq.getMtype());
            entity.setMPlace(sportBetsReq.getBetFormDetail());
            entity.setMRate(sportBetsReq.getOddsv());
            entity.setPType(sportBetsReq.getType());
            entity.setShowType(sportBetsReq.getBetFormType());
            entity.setType("0");
            sportBillMixEntities.add(entity);

        }
        sportBillMapper.batchSaveMixBill(sportBillMixEntities);
        BigDecimal betFormAmount = mixBetsReq.getBetFormAmount().negate();
        userService.updateBalance(user.getId(),betFormAmount,"下注",id);
        user.setMoney(user.getMoney().add(betFormAmount));//重置用户金额
        return id;
    }

    private String betMixValid(UserInfoEntity user, @Valid MixBetsReq mixBetsReq) throws Exception{
        String msg="";
        if (user.getMoney().compareTo(mixBetsReq.getBetFormAmount()) == -1) {
            msg="账户余额不足";
            return msg;
        }
        //校验所有的赛事是否过期
        BigDecimal oddTotals=null;
        for(SportBetsReq sportBetsReq:mixBetsReq.getBetVal()){
            SportEntity sportEntity=getSportById(sportBetsReq.getMid(),sportBetsReq.getMleagueid(),"r"+sportBetsReq.getType(),"rb"+sportBetsReq.getType());
            if(sportEntity==null){
                msg+=sportBetsReq.getMid()+"赛事过期;    ";
                continue;
            }
            //校验这个投注的赔率
            String typeJson=BeanUtils.getPropertyDescriptor(sportEntity.getClass(),sportBetsReq.getType()).getReadMethod().invoke(sportEntity)+"";
            JSONObject typejo=JSONObject.parseObject(typeJson);
            //获取赔率
            BigDecimal oddNum=typejo.getBigDecimal(sportBetsReq.getOddsid());
            if(oddNum==null||oddNum.compareTo(new BigDecimal(sportBetsReq.getOddsv()))>0){
                msg+=sportEntity.getMbteam()+"VS"+sportEntity.getTgteam()+"的赛事赔率已过期;    ";
                continue;
            }
            if(sportBetsReq.getType().matches("ah|ou|oe")){
                oddNum=oddNum.add(BigDecimal.ONE);
            }
            oddTotals=oddTotals==null?oddNum:oddTotals.multiply(oddNum);
            sportBetsReq.setMtype(sportEntity.getMtype());
            sportBetsReq.setSportType(sportEntity.getType());

        }
        if(StringUtils.isNotBlank(msg)){
            return msg;
        }
        //校验赔率和可赢金额
        oddTotals=oddTotals.setScale(1, RoundingMode.UP).subtract(BigDecimal.ONE);
        if(oddTotals.compareTo(mixBetsReq.getMrate())<0){
            msg="赔率异常";
            return msg;
        }
        if(oddTotals.multiply(mixBetsReq.getBetFormAmount()).compareTo(mixBetsReq.getWinableAmount())<0){
            msg="可赢金额异常";
            return msg;
        }
        return null;
    }
}
