package com.cn.great.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.DictConstant;
import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.service.DictService;
import com.cn.great.service.RelatedLotteryService;
import com.cn.great.service.UserService;
import com.cn.great.util.IdGenerator;
import com.cn.great.util.RedisUtil;
import com.cn.great.util.RestTemplateUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;


/**
 * @Description:
 * @Author: zach.M
 * @Date: 2019/4/4
 */
@Service
@Slf4j
public class RelatedLotteryServiceImpl implements RelatedLotteryService {

    @Autowired
    private UserService userService;
    @Autowired
    private DictService dictService;
    @Autowired
    private RedisUtil redisUtil;
    private static final String BASE_URL_KEY="lottery_";//登陆

    @Override
    public JSONObject login(String userName) throws IOException {
        MemberInfoEntity member=userService.getMemberInfo(userName);
        //如果未开通彩票
        if(member==null||0==member.getCpopen()){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_GAME);
        }
        //获取彩票的注册地址
        String url=dictService.getDictValue(BASE_URL_KEY+DictConstant.URL_REGISTER);

        //确定有没有注册过
        Object hasRegister= redisUtil.get(userName+Constant.USER_REGISTER_LOTTERY_SALT);
        if(hasRegister==null){
            //直接注册
            Map<String,Object> param=new HashMap();
            param.put("username",userName+Constant.THIRD_LOGIN_NAME_SALT);
            param.put("password", Constant.THIRD_PASSWORD);
            param.put("realName",userName);
            param.put("payPassword",member.getWithdrawalPasswd());
            param.put("referer",url);
            ResponseEntity<String> registerResult= RestTemplateUtils.postJson(url,param);
            log.info(url+":"+registerResult.getBody());
            if(!registerResult.getStatusCode().equals(HttpStatus.OK)){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.REGISTER_REQUEST_FAILED);
            }
            JSONObject registerJo=JSONObject.parseObject(registerResult.getBody());
            //如果不是注册成功或者是已注册
            if(!registerJo.getString("httpCode").equals("532")&&!registerJo.getString("httpCode").equals("521")){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.REGISTER_THIRD_FAILED);
            }
            redisUtil.set(userName+Constant.USER_REGISTER_LOTTERY_SALT,true);
        }
        //获取彩票的注册地址
        String loginUrl=dictService.getDictValue(BASE_URL_KEY+DictConstant.URL_LOGIN);
        Map<String,Object> param=new HashMap();
        param.put("username",userName+Constant.THIRD_LOGIN_NAME_SALT);
        param.put("password", Constant.THIRD_PASSWORD);
        ResponseEntity<String> loginResult=RestTemplateUtils.postJson(loginUrl,param);
        log.info(loginUrl+":"+loginResult.getBody());
        if(!loginResult.getStatusCode().equals(HttpStatus.OK)){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.LOGIN_REQUEST_FAILED);
        }
        JSONObject loginJo=JSONObject.parseObject(loginResult.getBody());
        //如果不是登陆成功或者是已在线
        if(!loginJo.getString("httpCode").equals("515")&&!loginJo.getString("httpCode").equals("553")){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.LOGIN_THIRD_FAILED);
        }
        JSONObject jo=loginJo.getJSONArray("response").getJSONObject(0);
        redisUtil.set(userName+Constant.USER_LOGIN_LOTTERY_SALT,jo,25*60);
       return jo;
        }

    @Override
    public String getLoginUrl(String userName) throws Exception{
        JSONObject jo;
        jo = getLotteryUsers(userName);
        String dictValue=dictService.getDictValue(BASE_URL_KEY+DictConstant.URL_MIANPAGE);
        return dictValue+"?oid=tiyu&token="+jo.getString("sessionId");

    }

    private JSONObject getLotteryUsers(String userName) throws IOException {
        JSONObject jo;
        Object o= redisUtil.get(userName+ Constant.USER_LOGIN_LOTTERY_SALT);
        if(o!=null){
            jo=(JSONObject)o;
        }else{
            jo=login(userName);
        }
        return jo;
    }

    @Override
    public String getBalance(String userName) throws IOException {
        JSONObject users= getLotteryUsers(userName);
        String dictValue=dictService.getDictValue(BASE_URL_KEY+DictConstant.URL_GET_BALANCE);
        Map<String,Object> param=new HashMap();
        param.put("usersId",users.getString("id"));
        param.put("sessionId",users.getString("sessionId"));
        ResponseEntity<String> result=RestTemplateUtils.postJson(dictValue,param);
        log.info(dictValue+":"+result.getBody());
        if(!result.getStatusCode().equals(HttpStatus.OK)){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_BALANCE_REQUEST_FAILED);
        }
        JSONObject jo=JSONObject.parseObject(result.getBody());
        //如果不是登陆成功或者是已在线
        if(!jo.getString("httpCode").equals("200")){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.GET_BALANCE_THIRD_FAILED);
        }

        return jo.getJSONArray("response").getJSONObject(0).getString("balance");
    }

    @Override
    public void transfer(String userName, String transferType, BigDecimal amount) throws IOException {
        JSONObject users= getLotteryUsers(userName);
        String dictValue=dictService.getDictValue(BASE_URL_KEY+DictConstant.URL_TRANSFER);
        Map<String,Object> param=new HashMap<>();
        param.put("usersId",users.getString("id"));
        param.put("sessionId",users.getString("sessionId"));
        param.put("transferType",transferType);
        param.put("amount",amount.intValue());
        //检验余额是否足够
        if(transferType.equals("0")){
            UserInfoEntity info=userService.fetchUserInfo(userName);
            if(info.getMoney().compareTo(amount)<0){
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_BALANCE_NOT_ENOUGH);
            }
        }
        //调用转换接口
        ResponseEntity<String> result=RestTemplateUtils.postJson(dictValue,param);
        log.info(dictValue+":"+result.getBody());
        if(!result.getStatusCode().equals(HttpStatus.OK)){
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TRANSFER_REQUEST_FAILED);
        }
        String orderId="CP"+ IdGenerator.getNumberString(10,"");
        JSONObject jo=JSONObject.parseObject(result.getBody());
        //检验自己的余额是不是足够

        //如果不是转换成功
//        if(!jo.getString("httpCode").equals("200")){
//            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TRANSFER_THIRD_FAILED);
//        }
//        JSONObject jsonResult=jo.getJSONArray("response").getJSONObject(0);
//        if(jsonResult.getString("returnCode").equals("554")){
//            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_LOTTERY_BALANCE_NOT_ENOUGH);
//        }
//        if(!jsonResult.getString("returnCode").equals("553")){
//            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TRANSFER_THIRD_FAILED);
//        }
        //TODO 等待彩票的对应的余额转换接口
        //修改余额以及生成转换记录
        userService.transferBalance(userName,transferType.equals("1")?Constant.LOTTERY_TRANSFER_ME:Constant.ME_TRANSFER_LOTTERY,amount, orderId);
    }

}
