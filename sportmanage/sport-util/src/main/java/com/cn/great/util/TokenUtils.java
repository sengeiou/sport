package com.cn.great.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.cn.great.model.user.UserToken;

import java.util.UUID;

/**
 * @program: sport
 * @description: Token生成器
 * @author: Stamp
 * @create: 2019-03-31 10:41
 **/
public class TokenUtils {

    /**
     * @Description: 生成JWT验证信息
     * @Param: [user]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/3/31
     */
    public String getToken(UserToken user) {
        String token = JWT.create().withAudience(user.getUserName())
                .sign(Algorithm.HMAC256(user.getToken()));
        return token;
    }


    /**
     * @Description: 生成唯一标示符
     * @Param: []
     * @return: java.lang.String
     * @Author: Stamp.M
     * @Date: 2019/3/26
     */
    public static String buildUUID() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

}
