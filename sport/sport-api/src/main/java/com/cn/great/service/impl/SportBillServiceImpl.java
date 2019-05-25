package com.cn.great.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.mapper.sportbill.SportBillMapper;
import com.cn.great.mapper.sportbill.SportsHotMapper;
import com.cn.great.mapper.sportbill.SportsShieldMapper;
import com.cn.great.mapper.user.MoneyLogMapper;
import com.cn.great.mapper.user.UserMapper;
import com.cn.great.model.common.Constant;
import com.cn.great.model.match.SportBillEntity;
import com.cn.great.model.match.SportHotEntity;
import com.cn.great.model.match.SportsShieldEntity;
import com.cn.great.model.mongo.SportEntity;
import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.model.user.MoneyLogEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.match.*;
import com.cn.great.service.SportBillService;
import com.cn.great.util.DateUtils;
import com.cn.great.util.IPUtils;
import com.cn.great.util.OkHttpUtil;
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

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.*;
import java.util.regex.Pattern;


/**
 * 体育注单Service
 */
@Service
@Slf4j
public class SportBillServiceImpl implements SportBillService {

    @Autowired
    private SportBillMapper sportBillMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private MoneyLogMapper moneyLogMapper;

    @Autowired
    private MongoTemplate mongoTemplate;

    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private SportsHotMapper sportsHotMapper;
    @Autowired
    private SportsShieldMapper sportsShieldMapper;


    /**
     * 查询下注记录
     *
     * @param req
     * @return
     */
    @Override
    public List<SportBillEntity> getSportBetLog(SportBetLogReq req) {
        return sportBillMapper.getSportBetLog(req);
    }

    /**
     * 查询下注限额
     *
     * @param type 1足球 2篮球
     * @return
     */
    @Override
    public Object getQuotaConfig(Integer type) {
        if (type == 1)
            return sportBillMapper.getFootballQuotaConfig();
        return sportBillMapper.getBasketballQuotaConfig();
    }

    /**
     * 根据赛事ID，联赛ID查询联赛信息
     *
     * @param mid
     * @param mLeagueId
     * @return
     */
    @Override
    public List<SportHotEntity> getSportHotById(int mid, int mLeagueId) {
        return sportBillMapper.getSportHotById(mid, mLeagueId);
    }

    /**
     * 下注
     *
     * @param user
     * @param sportBets
     * @return
     */
    @Override
    @Transactional
    public void addBet(SportBetsReq sportBets,
                       SportHotEntity sportHot,
                       UserInfoEntity user,
                       HttpServletRequest request) throws ParseException {
        insertSportBill(sportBets, sportHot, user, request);
    }

    /**
     * 收藏赛事
     *
     * @param collectionReq
     * @return
     */
    @Override
    @Transactional
    public String collectSportMatch(CollectionReq collectionReq,MemberInfoEntity memberInfo) {
        String type = collectionReq.getType();
        JSONObject json = JSONObject.parseObject(memberInfo.getCollection());
        switch (type) {
            case Constant.TYPE_ADD:
            {
                //build Collection Json
                json.put(collectionReq.getMleagueid(),collectionReq.getMleague());
                memberInfo.setCollection(json.toString());
                userMapper.updateMemberCollect(memberInfo);
                break;
            }
            case Constant.TYPE_DEL:
            {
                //build Collection Json
                json.remove(collectionReq.getMleagueid());
                memberInfo.setCollection(json.toString());
                userMapper.updateMemberCollect(memberInfo);
                break;
            }
            default:
                break;
        }
        return json.toString();
    }

    /**
     * 获取赛事分类
     *
     * @param req
     * @return
     */
    @Override
    public String getMatchCategory(MatchCategoryReq req) {
        JSONObject json = new JSONObject();
        json.put("pid",req.getPid());
        json.put("v",req.getV());
        return OkHttpUtil.sendPost(Constant.MATCH_CATEGORY_POST_URL,json.toString());
    }

    /**
     * 获取赛事信息
     *
     * @param req
     * @return
     */
    @Override
    public String getMatchInfomations(MatchReq req) {
        String param = req.toString();
        log.info(">>>>>>>>>>>>>>>param:"+req.getSid());
        log.info(">>>>>>>>>>>>>>>param:"+param);
        return OkHttpUtil.sendPost(Constant.MATCH_ODDS_POST_URL,param);
    }

    /**
     * 获取赛事信息
     *
     * @param req
     * @return
     */
    @Override
    public String getMatchInfomation(MatchSingleReq req) {
        JSONObject json = new JSONObject();
        json.put("eid",req.getEid());
        json.put("isp",req.getIsp());
        json.put("v",req.getV());
        //{"eid":"3117996","ifl":false,"iip":false,"isp":false,"ot":2,"ubt":"am","tz":480,"v":0}
        json.put("ifl",req.getIfl());
        json.put("iip",req.getIip());
        json.put("tz",req.getTz());
        json.put("ubt",req.getUbt());
        json.put("ot",req.getOt());
        return OkHttpUtil.sendPost(Constant.MATCH_ODD_POST_URL,json.toString());
    }

     /**
     * 获取直播数据
     * @param req
     * @return
     */
    @Override
    public String getLiveData(MatchLiveReq req){
        return OkHttpUtil.sendGet(Constant.MATCH_LIVE_STREAM_GET_URL,req.toString());
    }


    public Collection<SportEntity> getSports(@Valid SportReq req) {
        //从缓存里面拿
        Collection<SportEntity> list=getRedisSport(req);
        //查询数据库
        if(list==null||list.size()==0){
            list=getMongoSport(req);
        }
        //赛事屏蔽逻辑
        Map<String,Set<Object>> shield=getShields();
        Set<Object> mids=shield.get(Constant.SPORT_SHIELD_SALT);
        Set<Object> mleagues=shield.get(Constant.SPORT_MLEAGUE_SHIELD_SALT);
//        //遍历删除,去掉被屏蔽的赛事
        Iterator<SportEntity> iterator = list.iterator();
        while (iterator.hasNext()) {
            SportEntity sportEntity = iterator.next();
            if (mids.contains(sportEntity.getMid()) || mleagues.contains(sportEntity.getMleagueid())) {
                iterator.remove();//使用迭代器的删除方法删除
            }
        }
        return list;
    }

    private Map<String,Set<Object>> getShields() {
        Map<String,Set<Object>> map=new HashMap<>();
        Set<Object> set= redisUtil.sGet(Constant.SPORT_SHIELD_SALT);
        Set<Object>  set1= redisUtil.sGet(Constant.SPORT_MLEAGUE_SHIELD_SALT);
        if(set==null&&set1==null){
            set=new HashSet<>();
            set1=new HashSet<>();
            List<SportsShieldEntity> shieldEntities=sportsShieldMapper.queryAll();
            for(SportsShieldEntity p:shieldEntities){
                if(p.getType()==1){
                    set.add(p.getMId());
                }else{
                    set1.add(p.getMId());
                }
            }

        }
        map.put(Constant.SPORT_SHIELD_SALT,set);
        map.put(Constant.SPORT_MLEAGUE_SHIELD_SALT,set1);
        return map;
    }
    private Set<Object> getHots(){
        Set<Object> set= redisUtil.sGet(Constant.SPORT_HOT_SALT);
        if(set==null){
            set=new HashSet<>();
            List<SportHotEntity> sportHotEntities=sportsHotMapper.queryAll();
            for(SportHotEntity p:sportHotEntities){
                set.add(p.getMid());
            }
        }
        return set;
    }
    private List<SportEntity> getRedisSport(@Valid SportReq req) {
        Map<Object, Object> map= redisUtil.hmget(Constant.SPORT_LIST_SALT);
        List<SportEntity> list=new ArrayList();
        for(Object s:map.values()){
            List<SportEntity> clist=(List<SportEntity>)s;
            list.addAll(clist);
        }
        //遍历删除,去掉被屏蔽的赛事
        Iterator<SportEntity> iterator = list.iterator();
        while (iterator.hasNext()) {
            SportEntity sportEntity = iterator.next();
            //赛事种类 ft足球 bk篮球 等
            if(StringUtils.isNotBlank(req.getSportType())&&!sportEntity.getType().equals(req.getSportType())){
                 list.remove(sportEntity);
            }
            //r早盘,rb 今日,re滚球 p3串场
            if(StringUtils.isNotBlank(req.getMtype())&&! sportEntity.getMtype().equals(req.getMtype())){
                list.remove(sportEntity);
            }
            //rtype 玩法类型
            if(StringUtils.isNotBlank(req.getRtype())&&!sportEntity.getPtype().equals(req.getRtype())){
                list.remove(sportEntity);
            }
            //mdate 赛事日期,早盘查询某一天需要
            if(StringUtils.isNotBlank(req.getMdate())&&!sportEntity.getMdate().equals(req.getMdate())){
                list.remove(sportEntity);
            }
            //单个赛事查询
            if(StringUtils.isNotBlank(req.getMid())&&!sportEntity.getMid().equals(req.getMid())){
                list.remove(sportEntity);
            }
            if(StringUtils.isNotBlank(req.getMleagueid())&&!sportEntity.getMleagueid().equals(req.getMleagueid())){
                list.remove(sportEntity);
            }
            if(req.getTv()!=null&&!sportEntity.getTv().equals(req.getTv())){
                list.remove(sportEntity);
            }
        }
        return list;
    }

    private Collection<SportEntity> getMongoSport(@Valid SportReq req) {
        Criteria criteria=Criteria.where("1").is("1");
        //赛事种类 ft足球 bk篮球 等
        if(StringUtils.isNotBlank(req.getSportType())){
            criteria.and("type").equals(req.getSportType());
        }
        //r早盘,rb 今日,re滚球 p3串场
        if(StringUtils.isNotBlank(req.getMtype())){
            criteria.and("mtype").equals(req.getMtype());
        }
        //rtype 玩法类型
        if(StringUtils.isNotBlank(req.getRtype())){
            criteria.and("ptype").equals(req.getRtype());
        }
        //mdate 赛事日期,早盘查询某一天需要
        if(StringUtils.isNotBlank(req.getMdate())){
            criteria.and("mdate").equals(req.getMdate());
        }
        //单个赛事查询
        if(StringUtils.isNotBlank(req.getMid())){
            criteria.and("mid").equals(req.getMid());
        }
        if(StringUtils.isNotBlank(req.getMleagueid())){
            criteria.and("mleagueId").equals(req.getMleagueid());
        }
        if(req.getTv()!=null){
            criteria.and("tv").is(req.getTv());
        }
        //搜索赛事接口
        if(StringUtils.isNotBlank(req.getInputVal())){
            Pattern pattern= Pattern.compile("^.*"+req.getInputVal()+".*$", Pattern.CASE_INSENSITIVE);
            criteria.orOperator(Criteria.where("mleague").regex(pattern),Criteria.where("mbteam").regex(pattern),Criteria.where("tgteam").regex(pattern));
        }
        Query query = Query.query(criteria);
        //mdate 赛事日期,早盘查询某一天需要
        Sort sort = Sort.by(Sort.Direction.DESC, "mid","deletime");
        if(1==req.getOrder()){
            sort = Sort.by(Sort.Direction.DESC,"mdate","deletimes");
        }
        LinkedHashMap<Integer,SportEntity> norepeat=new LinkedHashMap<>();
        List<SportEntity> list= mongoTemplate.find(query.with(sort), SportEntity.class);
        //去重操作
        list.forEach(p->norepeat.putIfAbsent(p.getMid(),p));
        //分页操作 暂时不要
        return norepeat.values();
    }

    @Override
    public JSONObject homeSportQuery(@Valid SportReq req) {
        //获取所有正在直播的数据
        req.setTv(true);
        Collection<SportEntity> collection= getSports(req);
        JSONObject jo=new JSONObject();
        for(SportEntity entity:collection){
            JSONObject object=new JSONObject();
            object.put("mleagueid",entity.getMleagueid());
            object.put("mid",entity.getMid());
            object.put("mleague",entity.getMleague());
            object.put("mbteam",entity.getMbteam());
            object.put("tgteam",entity.getTgteam());
            object.put("nums",entity.getNums());
            object.put("score1",entity.getScore1());
            object.put("score2",entity.getScore2());
            object.put("times",entity.getTimes());
            JSONObject data=jo.getJSONObject(entity.getMtype()+"data");
            //"reData": {
            if(data==null){
                data=new JSONObject();
                jo.put(entity.getMtype()+"data",data);
            }
            // "ft": [
            JSONArray ja=data.getJSONArray(entity.getType());
            if(ja==null){
                ja=new JSONArray();
                data.put(entity.getType(),ja);
            }
            ja.add(jo);

            //如果是今日数据，判定是一个小时之类会进行的还是一个小时之外进行的
            if("rb".equals(entity.getMtype())){
                Long sprotTime=entity.getDatetimes();
                if(sprotTime>System.currentTimeMillis()/1000){
                    //如果是一个小时之内的
                    String key;
                    if(sprotTime-System.currentTimeMillis()/1000<=60*60){
                       key="timeft";
                    }else {
                        key="timebk";
                    }
                    JSONArray time=data.getJSONArray(key);
                    if (time==null){
                        time=new JSONArray();
                        data.put(key,time);
                    }
                    time.add(object);
                }
            }
            //判断是否为热门数据 存储热门数据
            Set<Object> hots=getHots();
            if(hots.contains(entity.getMid())){
                JSONObject hotData=jo.getJSONObject("hotData");
                //"hotData": {
                if(hotData==null){
                    hotData=new JSONObject();
                    jo.put("hotData",hotData);
                }
                // "ft": [
                JSONArray hotja=hotData.getJSONArray(entity.getType());
                if(ja==null){
                    hotja=new JSONArray();
                    data.put(entity.getType(),hotja);
                }
                hotja.add(jo);
            }
        }
        return jo;
    }

    @Override
    public JSONObject sportCount() {
        SportReq req = new SportReq();
        Collection<Championships> championshipList=getSportOr(req);
        Collection<SportEntity> sportEntities=getSports(req);
        JSONObject jo=new JSONObject();
        Map<String,Integer> orMap=new HashMap<>();
        for(Championships championships:championshipList){
            String typeKey=championships.getType();
            Integer number=orMap.get(typeKey);
            if (number==null){
                number=1;
            }else{
                number++;
            }
            orMap.put(typeKey,number);
        }
        //组json数据
        for(SportEntity sportEntity:sportEntities){
            if("re".equals(sportEntity.getMtype())){
                JSONArray re=jo.getJSONArray(sportEntity.getMtype());
                Map<String,JSONObject> map=new HashMap<>();
                map.put("ft",new JSONObject());
                map.put("bk",new JSONObject());
                if(re==null){
                    re=new JSONArray();
                    jo.put(sportEntity.getMtype(),re);
                    JSONObject ft=map.get("ft");
                    JSONObject bk=map.get("bk");
                    ft.put("ec",0);
                    ft.put("k","1");
                    ft.put("n","足球");
                    ft.put("hi",true);
                    bk.put("ec",0);
                    bk.put("k","2");
                    bk.put("n","篮球");
                    bk.put("hi",true);
                    re.add(ft);
                    re.add(bk);
                }
                JSONObject types=map.get(sportEntity.getType());
                types.put("ec",types.getIntValue("ec")+1);
            }else{
                JSONObject mtypeObj=jo.getJSONObject(sportEntity.getMtype());
                if(mtypeObj==null){
                    mtypeObj=new JSONObject();
                }
                String typeKey="";
                switch (sportEntity.getType()){
                    case "ft" : typeKey="1";break;
                    case "bk" : typeKey="2";break;
                }
                JSONObject typeObj=mtypeObj.getJSONObject(typeKey);
                if (typeObj==null){
                    typeObj=new JSONObject();
                    typeObj.put("or",orMap.get(sportEntity.getType()));
                }
                typeObj.put(sportEntity.getPtype(),typeObj.getIntValue(sportEntity.getPtype())+1);
            }
            JSONObject hotJo=new JSONObject();
            Set<Object> hotSet=getHots();
            if(hotSet.contains(sportEntity.getMid())){
                hotJo.put("num",hotJo.getIntValue("num")+1);
            }
        }
        return jo;
    }

    @Override
    public Collection<Championships> sportOrQuery(SportReq req) {
        Collection<Championships> list=getSportOr(req);
        //赛事屏蔽逻辑
        Map<String,Set<Object>> shield=getShields();
        Set<Object> mids=shield.get(Constant.SPORT_SHIELD_SALT);
        Set<Object> mleagues=shield.get(Constant.SPORT_MLEAGUE_SHIELD_SALT);
//        //遍历删除,去掉被屏蔽的赛事
        Iterator<Championships> iterator = list.iterator();
        while (iterator.hasNext()) {
            Championships championships = iterator.next();
            if (mids.contains(championships.getMid()) || mleagues.contains(championships.getMleagueid())) {
                iterator.remove();//使用迭代器的删除方法删除
            }
        }
        return list;
    }

    @Override
    public List<SportRet> listLeague(@Valid SportReq req) {
        List<SportRet> sportRets=new ArrayList<>();
        Collection<SportEntity> list=getSports(req);
        Map<Integer,SportEntity> map=new LinkedHashMap<>();
        //去重
        list.forEach(p->map.putIfAbsent(p.getMleagueid(),p));
        for(SportEntity sportEntity:map.values()){
            SportRet sportRet=new SportRet();
            BeanUtils.copyProperties(sportRet,sportEntity);
            sportRets.add(sportRet);
        }
        return sportRets;
    }

    private Collection<Championships> getSportOr(SportReq req) {
        //redis缓存获取
        Collection<Championships> list=getRedisSportOr(req);
        //从mongoDb取
        if(list==null){
            list=getMongoSportOr(req);
        }

        return list;
    }

    private Collection<Championships> getMongoSportOr(SportReq req) {
        Criteria criteria=Criteria.where("1").is("1");
        //赛事种类 ft足球 bk篮球 等
        if(StringUtils.isNotBlank(req.getSportType())){
            criteria.and("type").equals(req.getSportType());
        }
        //mdate 赛事日期,早盘查询某一天需要
        if(StringUtils.isNotBlank(req.getMdate())){
            criteria.and("mdate").equals(req.getMdate());
        }
        //单个赛事查询
        if(StringUtils.isNotBlank(req.getMid())){
            criteria.and("mid").equals(req.getMid());
        }
        if(StringUtils.isNotBlank(req.getMleagueid())){
            criteria.and("mleagueId").equals(req.getMleagueid());
        }
        Query query = Query.query(criteria);
        //mdate 赛事日期,早盘查询某一天需要
        Sort sort = Sort.by(Sort.Direction.DESC, "mid","deletime");
        LinkedHashMap<Integer,Championships> norepeat=new LinkedHashMap<>();
        List<Championships> list= mongoTemplate.find(query.with(sort), Championships.class);
        //去重操作
        list.forEach(p->norepeat.putIfAbsent(p.getMid(),p));
        //分页操作 暂时不要
        return norepeat.values();
    }

    private Collection<Championships> getRedisSportOr(SportReq req) {
        Map<Object, Object> map= redisUtil.hmget(Constant.SPORT_OR_LIST_SALT);
        List<Championships> list=new ArrayList();
        for(Object s:map.values()){
            List<Championships> clist=(List<Championships>)s;
            list.addAll(clist);
        }
        //遍历删除,去掉被屏蔽的赛事
        Iterator<Championships> iterator = list.iterator();
        while (iterator.hasNext()) {
            Championships championships = iterator.next();
            //赛事种类 ft足球 bk篮球 等
            if(StringUtils.isNotBlank(req.getSportType())&&!championships.getType().equals(req.getSportType())){
                list.remove(championships);
            }
            //mdate 赛事日期,早盘查询某一天需要
            if(StringUtils.isNotBlank(req.getMdate())&&!championships.getMdate().equals(req.getMdate())){
                list.remove(championships);
            }
            //单个赛事查询
            if(StringUtils.isNotBlank(req.getMid())&&!championships.getMid().equals(req.getMid())){
                list.remove(championships);
            }
            if(StringUtils.isNotBlank(req.getMleagueid())&&!championships.getMleagueid().equals(req.getMleagueid())){
                list.remove(championships);
            }
        }
        return list;
    }

    //注单新增
    private void insertSportBill(SportBetsReq sportBets, SportHotEntity sportHot, UserInfoEntity user, HttpServletRequest request) throws ParseException {

        String bettime = DateUtils.getDateTime();
        JSONObject json = new JSONObject();
        json.put("mid", sportHot.getMid());
        json.put("type", sportHot.getType());
        json.put("mdate", sportHot.getMDate());
        json.put("mtype", sportBets.getMtype());
        json.put("mbteam", sportHot.getMbTeam());
        json.put("tgteam", sportHot.getTgTeam());
        json.put("bettime", bettime);
        json.put("billVal", sportHot.getMbTeam() + " " + "m_place" + " " + "@" + " " + sportBets.getOddsv()); //m_place
        json.put("mleague", sportHot.getMLeague());
        json.put("billTitle", "");   //
        json.put("mleagueid", sportHot.getMLeagueId());

        SportBillEntity sportBill = SportBillEntity.builder()
                .userId(user.getId())
                .userName(user.getUserName())
                .active(1)//
                .mid(sportBets.getMid())
                .mLeagueId(sportBets.getMleagueid())
                .mType(sportBets.getMtype())
                .middle(json.toString())
                .lineType(0)//
                .bettime(DateUtils.dateCheckTimeStamp(bettime))
                .gold(new BigDecimal(sportBets.getBetFormAmount()))
                .mDate(DateUtils.getDate())
                .mRate(sportBets.getOddsv())
                .mPlace("0")//
                .gwin(new BigDecimal("0.00"))
                .mResult(new BigDecimal("0.00"))
                .showType(sportBets.getBetFormType())
                .cancel(0)
                .type("0")
                .gType(sportBets.getSportType())
                .mbBall(0)
                .tgBall(0)
                .checked(0)
                .confirmed(0)
                .danger(0)
                .score1("0")
                .score2("0")
                .lastBetMoney(user.getMoney())
                .agentId(user.getAgentId())
                .betIp(IPUtils.getRealIp(request, 0))
                .serverAdmin(user.getServerAdmin()).build();
        Integer id = sportBillMapper.addBet(sportBill); //记录投注注单
        if (id != null) {
            BigDecimal money = user.getMoney(); //变动前余额
            BigDecimal betFormAmount = new BigDecimal(sportBets.getBetFormAmount());
            int updateResult = updateUserBalence(user, betFormAmount);//更新用户余额
            if (updateResult > 0) {
                //记录资金变动
                MoneyLogEntity moneyLog = new MoneyLogEntity();
                moneyLog.setMoney(betFormAmount);
                moneyLog.setMoneyf(money);
                moneyLog.setMoneys(money.subtract(betFormAmount));
                moneyLog.setType(1);
                moneyLog.setOrderId(id);
                moneyLog.setAddDate(String.valueOf(new Date().getTime() / 1000));
                moneyLog.setNotes("下注"); //billTitle
                int moneyLogResult = moneyLogMapper.addMoneyLog(moneyLog);
                if (moneyLogResult <= 0) {
                    log.info("记录资金变动失败.................");
                    throw GeneralException.initEnumGeneralException(ResponseCodeEnum.BET_FAILURE_ERROR);
                }
            } else {
                log.info("更新用户余额失败.................");
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.BET_FAILURE_ERROR);
            }
        } else {
            log.info("添加注单失败.................");
            GeneralException.initEnumGeneralException(ResponseCodeEnum.BET_FAILURE_ERROR);
        }
    }

    //更新用户余额
    private int updateUserBalence(UserInfoEntity user, BigDecimal betFormAmount) {
        user.setMoney(user.getMoney().subtract(betFormAmount));
        return userMapper.updateUserBalence(user);
    }

}
