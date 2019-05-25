package com.cn.great.handler;

import java.util.HashMap;
import java.util.Map;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.cn.great.model.online.LoginInfoEntity;
import com.cn.great.service.UserService;
import com.cn.great.util.SpringContextHolder;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Slf4j
public class HandShakeInterceptor extends HttpSessionHandshakeInterceptor {
    /*
     * 在WebSocket连接建立之前的操作，以鉴权为例
     */
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
                                   WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        log.info("握手前的鉴权操作。。。");
        String query=request.getURI().getQuery();
        Map<String,String> param=getUrlParams(query);
        String userName=checkToken(param.get("access-token"));
        attributes.put("userName",userName);
        return userName!=null;
    }
    /**
     * @Description: 连接请求参数token校验
     * @Param: [token]
     * @return: boolean
     * @Author: Stamp
     * @Date: 2019/4/5
     */
    private String checkToken(String token) {

        if (StringUtils.isBlank(token)) return null;
        String userName = "";
        try {
            userName = JWT.decode(token).getAudience().get(0);
        } catch (JWTDecodeException j) {
            log.error("token验证失败...");
            return null;
        }
        UserService userService= SpringContextHolder.getBean(UserService.class);
        LoginInfoEntity user = userService.getUserLoginInfo(userName);
        if (user == null) return null;
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(user.getToken())).build();
        try {
            jwtVerifier.verify(token);
        } catch (JWTVerificationException e) {
            log.error("token验证失败...");
            return null;
        }
        return userName;
    }
    /**
     * 将 String 转为 map
     *
     * @param param
     *            aa=11&bb=22&cc=33
     * @return
     */
    private static Map<String, String> getUrlParams(String param) {
        Map<String, String> map = new HashMap();
        if ("".equals(param) || null == param) {
            return map;
        }
        String[] params = param.split("&");
        for (int i = 0; i < params.length; i++) {
            String[] p = params[i].split("=");
            if (p.length == 2) {
                map.put(p[0], p[1]);
            }
        }
        return map;
    }
}