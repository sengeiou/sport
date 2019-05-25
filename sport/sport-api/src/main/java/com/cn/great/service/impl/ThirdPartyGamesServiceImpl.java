package com.cn.great.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.mapper.user.MgGamesMapper;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.DictConstant;
import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.user.AgLoginReq;
import com.cn.great.req.user.MgLoginReq;
import com.cn.great.service.DictService;
import com.cn.great.service.ThirdPartyGamesService;
import com.cn.great.service.UserService;
import com.cn.great.util.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import sun.misc.BASE64Encoder;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 * @Description:
 * @Author: zach.M
 * @Date: 2019/4/4
 */
@Service
@Slf4j
public class ThirdPartyGamesServiceImpl implements ThirdPartyGamesService {

    @Autowired
    private UserService userService;
    @Autowired
    private DictService dictService;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private MgGamesMapper mgGamesMapper;

    private static final String BASE_URL_AG ="ag_";
    private static final String BASE_URL_MG ="mg_";


    @Override
    public void agRegister(String userName) {
        MemberInfoEntity member=userService.getMemberInfo(userName);
        //如果未开通AG
        if(member==null||0==member.getAgopen()){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_GAME);
        }
        //获取AG的注册地址
        String  url = dictService.getDictValue(BASE_URL_AG + DictConstant.URL_REGISTER);
        //确定有没有注册过
        Object hasRegister= redisUtil.get(userName+ Constant.USER_REGISTER_AG_SALT);
        if(hasRegister==null){
            //直接注册
            String deskey= dictService.getDictValue(DictConstant.AG_DESKEY);//des密钥
            String md5key= dictService.getDictValue(DictConstant.AG_MD5KEY);//MD5密钥
            String namePrefix=dictService.getDictValue(DictConstant.AG_NAME_PREFIX);//获取用户名前缀
            String agent=dictService.getDictValue(DictConstant.AG_AGENT);//获取代理名称
            Map<String,Object> param=new LinkedHashMap();
            param.put("cagent",agent);
            param.put("loginname", namePrefix+userName+Constant.THIRD_LOGIN_NAME_SALT);
            param.put("method","lg");
            param.put("actype","1");
            param.put("password",Constant.THIRD_PASSWORD);
            param.put("oddtype","A");
            param.put("cur","CNY");

            DesEncryptDecrytUtils encrypt=new DesEncryptDecrytUtils(deskey);
            String sign=encrypt.encrypt(map2String(param,Constant.AG_PARAM_SPLIT));
            String md5Str = MD5Utils.encodeByMD5(sign+md5key);
            param.clear();
            param.put("param",sign);
            param.put("key",md5Str);
            ResponseEntity<String> result= RestTemplateUtils.get(url,String.class,param);
            log.info(url+":"+result.getBody());
            if(!result.getStatusCode().equals(HttpStatus.OK)){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.REGISTER_REQUEST_FAILED);
            }
            //如果不是注册成功或者是已注册
            Map<String,Object> doc = XmlUtils.xmlToMap(result.getBody()); // 将字符串转为XML
            String info = doc.get("info").toString(); // 获取返回成功标识
            if(!info.equals("0")){// TODO 重复注册也是ok的，缺少这块的逻辑
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.REGISTER_THIRD_FAILED);
            }
            redisUtil.set(userName+Constant.USER_REGISTER_AG_SALT,System.currentTimeMillis()/1000);
        }
    }

    private String map2String(Map<String, Object> param, String agParamSplit) {
        StringBuffer sb=new StringBuffer();
        for(String key:param.keySet()){
            sb.append(agParamSplit).append(key).append("=").append(param.get(key));
        }
        return sb.substring(agParamSplit.length());
    }
    @Override
    public String agLogin(String userName, AgLoginReq agLoginReq) {
        Object o= redisUtil.get(userName+ Constant.USER_LOGIN_AG_SALT);
        //判断是否已经登陆
        if(o==null){
            //判断是否有注册
            Object hasRegister= redisUtil.get(userName+ Constant.USER_REGISTER_AG_SALT);
            if(hasRegister==null) agRegister(userName);
            //获取AG的登陆地址
            String  url = dictService.getDictValue(BASE_URL_MG + DictConstant.URL_LOGIN);
            String deskey= dictService.getDictValue(DictConstant.AG_DESKEY);//des密钥
            String md5key= dictService.getDictValue(DictConstant.AG_MD5KEY);//MD5密钥
            String namePrefix=dictService.getDictValue(DictConstant.AG_NAME_PREFIX);//获取用户名前缀
            String agent=dictService.getDictValue(DictConstant.AG_AGENT);//获取代理名称
            Map<String,Object> param=new LinkedHashMap<>();
            param.put("cagent",agent);
            param.put("loginname", namePrefix+userName+Constant.THIRD_LOGIN_NAME_SALT);
            param.put("actype",agLoginReq.getActype());
            param.put("password",Constant.THIRD_PASSWORD);
            param.put("dm",agLoginReq.getDm());
            param.put("sid",agent+ RandomStringUtils.random(16));
            param.put("lang","1");
            param.put("gameType",agLoginReq.getGameType().equals(1)?null:agLoginReq.getGameType());
            param.put("cur","CNY");
            param.put("oddtype","A");
            DesEncryptDecrytUtils encrypt=new DesEncryptDecrytUtils(deskey);
            String sign=encrypt.encrypt(map2String(param,Constant.AG_PARAM_SPLIT));
            String md5Str = MD5Utils.encodeByMD5(sign+md5key);
            param.clear();
            param.put("param",sign);
            param.put("key",md5Str);
            String loginUrl=url+"?param="+sign+"&key="+md5Str;
            redisUtil.set(userName+ Constant.USER_LOGIN_AG_SALT,loginUrl,25*60);
           return loginUrl;

        }
        return o.toString();
    }

    @Override
    public String getAgBalance(String userName) {
        Object hasRegister= redisUtil.get(userName+ Constant.USER_REGISTER_AG_SALT);
        if(hasRegister==null) agRegister(userName);
        String  url = dictService.getDictValue(BASE_URL_AG + DictConstant.URL_LOGIN);
        String deskey= dictService.getDictValue(DictConstant.AG_DESKEY);//des密钥
        String md5key= dictService.getDictValue(DictConstant.AG_MD5KEY);//MD5密钥
        String namePrefix=dictService.getDictValue(DictConstant.AG_NAME_PREFIX);//获取用户名前缀
        String agent=dictService.getDictValue(DictConstant.AG_AGENT);//获取代理名称
        Map<String,Object> param=new LinkedHashMap<>();
        param.put("cagent",agent);
        param.put("loginname", namePrefix+userName+Constant.THIRD_LOGIN_NAME_SALT);
        param.put("method","gb");
        param.put("actype","1");
        param.put("password",Constant.THIRD_PASSWORD);
        param.put("cur","CNY");
        DesEncryptDecrytUtils encrypt=new DesEncryptDecrytUtils(deskey);
        String sign=encrypt.encrypt(map2String(param,Constant.AG_PARAM_SPLIT));
        String md5Str = MD5Utils.encodeByMD5(sign+md5key);
        param.clear();
        param.put("param",sign);
        param.put("key",md5Str);
        ResponseEntity<String> result= RestTemplateUtils.get(url,String.class,param);
        log.info(url+":"+result.getBody());
        if(!result.getStatusCode().equals(HttpStatus.OK)){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_BALANCE_REQUEST_FAILED);
        }
        Map<String,Object> doc = XmlUtils.xmlToMap(result.getBody()); // 将字符串转为XML
        String msg = doc.get("msg").toString(); // 获取返回成功标识
        String info = doc.get("info").toString();
        if(StringUtils.isNotBlank(msg)){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_BALANCE_THIRD_FAILED);
        }
        return info;
    }

    @Override
    public void agTransfer(String userName, String type, BigDecimal amount) {
        //检验余额是否足够 0 体育转Ag ,1 Ag转体育
        if(type.equals("0")){
            UserInfoEntity info=userService.fetchUserInfo(userName);
            if(info.getMoney().compareTo(amount)<0){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_BALANCE_NOT_ENOUGH);
            }
        }
        Object hasRegister= redisUtil.get(userName+ Constant.USER_REGISTER_AG_SALT);
        if(hasRegister==null) agRegister(userName);
        String  url = dictService.getDictValue(BASE_URL_AG + DictConstant.URL_TRANSFER);
        String deskey= dictService.getDictValue(DictConstant.AG_DESKEY);//des密钥
        String md5key= dictService.getDictValue(DictConstant.AG_MD5KEY);//MD5密钥
        String namePrefix=dictService.getDictValue(DictConstant.AG_NAME_PREFIX);//获取用户名前缀
        String agent=dictService.getDictValue(DictConstant.AG_AGENT);//获取代理名称
        String orderId="AG"+ IdGenerator.getNumberString(10,"");
        Map<String,Object> param=new LinkedHashMap<>();
        param.put("cagent",agent);
        param.put("loginname", namePrefix+userName+Constant.THIRD_LOGIN_NAME_SALT);
        param.put("method","tc");
        param.put("billno",orderId);
        param.put("type",type.equals("0")?"IN":"OUT");
        param.put("credit",amount);
        param.put("actype","1");
        param.put("password",Constant.THIRD_PASSWORD);
        param.put("cur","CNY");
        DesEncryptDecrytUtils encrypt=new DesEncryptDecrytUtils(deskey);
        String sign=encrypt.encrypt(map2String(param,Constant.AG_PARAM_SPLIT));
        String md5Str = MD5Utils.encodeByMD5(sign+md5key);
        param.clear();
        param.put("param",sign);
        param.put("key",md5Str);
        ResponseEntity<String> result= RestTemplateUtils.get(url,String.class,param);
        log.info(url+":"+result.getBody());
        if(!result.getStatusCode().equals(HttpStatus.OK)){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TRANSFER_REQUEST_FAILED);
        }
        Map<String,Object> doc = XmlUtils.xmlToMap(result.getBody()); // 将字符串转为XML
        String info = doc.get("info").toString();
        if(!info.equals("0")){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TRANSFER_THIRD_FAILED);
        }
        //修改余额以及生成转换记录
        userService.transferBalance(userName,type.equals("0")? Constant.ME_TRANSFER_AG:Constant.AG_TRANSFER_ME,amount,orderId);
    }

    @Override
    public void mgRegister(String userName) {
        Object o= redisUtil.get(userName+ Constant.USER_REGISTER_MG_SALT);
        if(o==null){
            MemberInfoEntity member=userService.getMemberInfo(userName);
            //如果未开通MG
            if(member==null||0==member.getMgopen()){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_GAME);
            }
            //获取token
            String token=getMgToken(userName);
            String url= dictService.getDictValue(BASE_URL_MG + DictConstant.URL_REGISTER);//用户名
            String parentId=dictService.getDictValue(DictConstant.MG_PARENT_ID);
            Map<String, String> header = getHeader(token);
            Map<String,Object> param=new HashMap<>();
            param.put("parent_id",parentId);
            param.put("username",userName);
            param.put("password",member.getUserId()+Constant.THIRD_PASSWORD);
            param.put("ext_ref",member.getUserId()+Constant.THIRD_USER_ID_SALT);
            ResponseEntity<String> result= RestTemplateUtils.postWithHeader(url,header,param);
            if(!result.getStatusCode().equals(HttpStatus.OK)){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_TOKEN_REQUEST_FAILED);
            }
            JSONObject jo = JSONObject.parseObject(result.getBody());
            if(jo.containsKey("error")){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_TOKEN_THIRD_FAILED);
            }
            redisUtil.set(userName+ Constant.USER_REGISTER_MG_SALT,true);
        }

    }


    @Override
    public String mgLogin(String userName, MgLoginReq mgLoginReq) {
        mgRegister(userName);
        Object o= redisUtil.get(userName+ Constant.USER_LOGIN_MG_SALT);
        if(o==null){
            //获取token
            String token=getMgToken(userName);
            String url= dictService.getDictValue(BASE_URL_MG + DictConstant.URL_LOGIN);//用户名
            Map<String, String> header = getHeader(token);
            Map param = new HashMap();
            Map<String, String> dataLang = new HashMap();
            dataLang.put("lang","zh_CN");
            param.put("demo",mgLoginReq.getActype().equals(1)?true:false);
            param.put("external","true");
            param.put("app_id", mgLoginReq.getApp_id());
            param.put("item_id",mgLoginReq.getGame_id());
            param.put("login_context",dataLang);
            ResponseEntity<String> result= RestTemplateUtils.postWithHeader(url,header,param);
            if(!result.getStatusCode().equals(HttpStatus.OK)){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_TOKEN_REQUEST_FAILED);
            }
            JSONObject jo = JSONObject.parseObject(result.getBody());
            if(jo.containsKey("error")){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.LOGIN_THIRD_FAILED);
            }
            redisUtil.set(userName+ Constant.USER_REGISTER_MG_SALT,true);
            return jo.getString("data");
        }
        return o.toString();
    }

    @Override
    public List<Map<String, Object>> mgGameList(String terminal) {
        List<Map<String, Object>> list=mgGamesMapper.listByType(terminal);
        return list;
    }

    @Override
    public String getMgBalance(String userName) {
        MemberInfoEntity member=userService.getMemberInfo(userName);
        //注册
        mgRegister(userName);
        //获取token
        String token=getMgToken(userName);
        String url= dictService.getDictValue(BASE_URL_MG + DictConstant.URL_GET_BALANCE);//用户名
        Map<String, String> header = getHeader(token);
        url+="account_ext_ref="+member.getUserId()+Constant.THIRD_USER_ID_SALT;
        ResponseEntity<String> result= RestTemplateUtils.get(url,header,String.class);
        if(!result.getStatusCode().equals(HttpStatus.OK)){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_BALANCE_REQUEST_FAILED);
        }
        JSONObject jo = JSONObject.parseObject(result.getBody());
        if(jo.containsKey("error")){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_BALANCE_THIRD_FAILED);
        }
        return jo.getJSONArray("data").getJSONObject(0).getString("credit_balance");
    }

    @Override
    public void mgTransfer(String userName, @NotBlank String type, @NotNull BigDecimal amount) {
        //type 0 体育转MG ,1 MG转体育
        MemberInfoEntity member=userService.getMemberInfo(userName);
        //注册
        mgRegister(userName);
        //获取token
        String token=getMgToken(userName);
        //生成orderId
        String orderId="AG"+ IdGenerator.getNumberString(10,"");
        String url= dictService.getDictValue(BASE_URL_MG + DictConstant.URL_TRANSFER);//获取额度转换url
        Map<String, String> header = getHeader(token);
        MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
        map.add("account_ext_ref", member.getUserId()+Constant.THIRD_USER_ID_SALT);
        map.add("amount", amount);
        map.add("type", type.equals("0")?"CREDIT":"DEBIT");
        map.add("balance_type", "CREDIT_BALANCE");
        map.add("category", "TRANSFER");
        map.add("external_ref", orderId);
        ResponseEntity<String> result= RestTemplateUtils.post(url,map,String.class);
        if(!result.getStatusCode().equals(HttpStatus.OK)){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_BALANCE_REQUEST_FAILED);
        }
        JSONObject jo = JSONObject.parseObject(result.getBody());
        if(jo.containsKey("error")){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_BALANCE_THIRD_FAILED);
        }
        //修改余额以及生成转换记录
        userService.transferBalance(userName,type.equals("0")? Constant.ME_TRANSFER_MG:Constant.MG_TRANSFER_ME,amount,orderId);
    }

    private String getMgToken(String userName) {
        Object token= redisUtil.get(userName+ Constant.USER_TOKEN_AG_SALT);
        if(token==null){
            String url= dictService.getDictValue(BASE_URL_MG + DictConstant.URL_GET_TOKEN);//用户名
            String apiUsername= dictService.getDictValue(DictConstant.MG_API_USERNAME);//用户名
            String apiPassword= dictService.getDictValue(DictConstant.MG_API_PASSWORD);//密码
            String hashPincode = userName + ":" + Constant.THIRD_PASSWORD;
            String authValue = new BASE64Encoder().encode(hashPincode.getBytes());
            Map<String, String> header = new HashMap<>();
            header.put("Authorization", "Basic" + " " + authValue);
            header.put("X-DAS-TZ", "UTC+8");
            header.put("X-DAS-CURRENCY", "CNY");
            header.put("X-DAS-LANG", "zh-CN");
            header.put("X-DAS-TX-ID", "TEXT-TX-ID");

            log.info("token header--------"+header.toString());
            Map<String, Object> map = new HashMap<>();
            map.put("grant_type", "password");
            map.put("username", apiUsername);
            map.put("password", apiPassword);
            ResponseEntity<String> result= RestTemplateUtils.postWithHeader(url,header,map);
            if(!result.getStatusCode().equals(HttpStatus.OK)){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_TOKEN_REQUEST_FAILED);
            }
            JSONObject jsonToken = JSONObject.parseObject(result.getBody());
            String tokenStr = jsonToken.getString("access_token");
            if(StringUtils.isBlank(tokenStr)){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_TOKEN_THIRD_FAILED);
            }
            redisUtil.set(userName+ Constant.USER_TOKEN_AG_SALT,token,28*60);
            return tokenStr;
        }
        return token.toString();

    }
    private Map<String, String> getHeader(String token) {
        Map<String, String> header = new HashMap<>();
        header.put("x-das-tz", "UTC+8");
        header.put("x-das-currency", "CNY");
        header.put("x-das-lang", "zh-CN");
        header.put("x-das-tx-id", "TEXT-TX-ID");
        header.put("authorization", "Bearer " + token);
        header.put("content-type", "application/json");
        return header;
    }

}
