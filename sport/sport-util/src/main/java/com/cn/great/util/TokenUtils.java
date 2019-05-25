package com.cn.great.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

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
    public static String getToken(String userName, String token) {
        String accessToken = JWT.create().withAudience(userName)
                .sign(Algorithm.HMAC256(token));
        return accessToken;
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
