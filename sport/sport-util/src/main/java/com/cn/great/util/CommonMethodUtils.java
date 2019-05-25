package com.cn.great.util;

import com.cn.great.enums.OnlineEnum;
import com.cn.great.model.online.LoginInfoEntity;
import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.user.RegisterReq;
import com.sun.org.apache.bcel.internal.generic.RETURN;
import org.apache.commons.lang3.StringUtils;

import java.math.BigDecimal;

/**
 * @program: sport
 * @description: 接口中公共方法类（统一抽取）
 * @author: Stamp
 * @create: 2019-04-02 11:17
 **/
public class CommonMethodUtils {

    public static LoginInfoEntity buildLoginInfo(UserInfoEntity user, String ip, String url, String token) {
        LoginInfoEntity loginInfo = new LoginInfoEntity();
        loginInfo.setUserId(user.getId());
        loginInfo.setUserName(user.getUserName());
        loginInfo.setOnline(OnlineEnum.getCode("登录"));
        loginInfo.setType(0);
        loginInfo.setLoginTime(DateUtils.getDateTime());
        loginInfo.setLoginIp(ip);
        loginInfo.setLoginUrl(url);
        loginInfo.setOnlineTime(DateUtils.getDateTime());
        loginInfo.setToken(token);
        return loginInfo;
    }

    public static UserInfoEntity buildUserInfo(String userName, Integer agentId, String password, String serverAdmin) {
        UserInfoEntity user = new UserInfoEntity();
        user.setUserName(userName);
        user.setMoney(new BigDecimal("0.00"));
        user.setMoney2(new BigDecimal("0.00"));
        user.setCtime(0);
        user.setCmoney(new BigDecimal("0.00"));
        user.setTtime(0);
        user.setTmoney(new BigDecimal("0.00"));
        user.setSumBet(0);
        user.setLevelId(0);
        user.setNotesWithdrawal("0");
        user.setStatus(0);
        if (agentId != -1) {
            user.setAgentId(agentId);
        } else {
            user.setAgentId(0);
        }
        user.setPassword(password);
        user.setServerAdmin(serverAdmin);
        return user;
    }

    public static MemberInfoEntity buildMemberInfo(RegisterReq registerReq, Integer userId, String ip) {

        MemberInfoEntity member = new MemberInfoEntity();
        member.setUserId(userId);
        member.setUserName(registerReq.getUsername());
        member.setAddDate(DateUtils.getDateTime());
        String birthday = registerReq.getBirthday();
        if (StringUtils.isBlank(birthday)) {
            birthday = "0";
        }
        member.setBirthday(birthday);
        member.setWithdrawalPasswd(registerReq.getWithdrawal_passwd());
        member.setNotes("0");
        member.setAgopen(0);
        member.setCpopen(0);
        member.setMgopen(0);
        member.setTestFlag(0);
        member.setBankId(0);
        member.setVipLevel(0);
        member.setHisBets(0);
        member.setHisLoss(0);
        member.setAlias(registerReq.getAlias());
        member.setRegIp(ip);
        member.setQuestion(registerReq.getQuestion());
        member.setAnswer(registerReq.getAnswer());
        return member;
    }

}
