package com.cn.great.util;

import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.agent.AgentOpeReq;
import com.cn.great.req.user.UserAddReq;
import com.cn.great.req.user.UserOpeReq;
import com.cn.great.req.user.UserUpdateReq;
import org.springframework.beans.BeanUtils;

import java.lang.reflect.Method;

/**
 * @program: agentmanage
 * @description: 公共方法提取类
 * @author: Stamp
 * @create: 2019-04-19 11:34
 **/
public class CommonMethodUtils {

    public static UserAddReq buildUserAdd(AgentOpeReq agentOpeReq, Integer type) {
        UserAddReq userReq = new UserAddReq();
        userReq.setUserName(agentOpeReq.getUserName());
        userReq.setAlias(agentOpeReq.getAlias());
        userReq.setPassword(agentOpeReq.getPassword());
        userReq.setServerAdmin(agentOpeReq.getServerAdmin());
        userReq.setAddDate(DateUtils.getDateTime());
        userReq.setType(String.valueOf(type));
        return userReq;
    }

    public static UserUpdateReq buildUserUpdate(AgentOpeReq agentOpeReq) {
        UserUpdateReq userReq = new UserUpdateReq();
        userReq.setId(agentOpeReq.getId());
        userReq.setUserName(agentOpeReq.getUserName());
        userReq.setAlias(agentOpeReq.getAlias());
        userReq.setPassword(agentOpeReq.getPassword());
        userReq.setStatus(agentOpeReq.getStatus());
        userReq.setServerAdmin(agentOpeReq.getServerAdmin());
        return userReq;
    }

    public static UserInfoEntity generateUserInfo(UserOpeReq userOpeReq) {

        UserInfoEntity user = new UserInfoEntity();
        BeanUtils.copyProperties(userOpeReq, user);
        return user;
    }

    public static MemberInfoEntity generateMemberInfo(UserOpeReq userOpeReq) {

        MemberInfoEntity user = new MemberInfoEntity();
        BeanUtils.copyProperties(userOpeReq, user);
        return user;
    }

    /**
     * @Description: 初始化小计和总计响应结果
     * @Param: [objs, sumtotals, fields]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/20
     */
    public static Integer initResObj(Object obj, Class clazz, String totals) {

        String[] sums = totals.split(",");
        Integer recordsTotal = Integer.valueOf(sums[0]);
        if (sums.length == 0 || obj == null) {
            return recordsTotal;
        }
        try {
            Method setMethod = clazz.getMethod("setSumtotals", String[].class);
            setMethod.invoke(obj, (Object) sums);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return recordsTotal;
    }

}
