package com.cn.great.common;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.Constant;
import com.cn.great.model.online.LoginInfoEntity;
import com.cn.great.service.UserService;
import com.cn.great.util.GeneralUtils;
import com.cn.great.util.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @program: sport
 * @description: access-token校验
 * @author: Stamp
 * @create: 2019-03-31 10:40
 **/
@Slf4j
@Component
public class AuthenticationInterceptor implements HandlerInterceptor {

    @Autowired
    private UserService userService;
    @Autowired
    private RedisUtil redisUtil;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object object) throws GeneralException {
        // session过期校验
        String sessionName = GeneralUtils.getStringValue(httpServletRequest
                .getSession().getAttribute(Constant.USER_NAME_SESSION));
        if(StringUtils.isBlank(sessionName)){
            log.error("用户session已过期, 请重新登录......");
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_SESSION_TIME_OUT);
        }
        String url = httpServletRequest.getRequestURI();
        log.info("<<<开始access-token验证>>> ");
        String token = httpServletRequest.getHeader("access-token");
        log.info("cur requestUrl is {};  cur token is {}; ", url, token);
        if (StringUtils.isBlank(token)) {
            log.error("access-token验证失败... token为null");
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TOKEN_NON_ERROR);
        }
        String userName = "";
        try {
            userName = JWT.decode(token).getAudience().get(0);
        } catch (JWTDecodeException j) {
            log.error("access-token验证失败... cur user is {}......", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TOKEN_NON_ERROR);
        }
        // 获取此会员登录信息
        Object obj = redisUtil.get(userName+Constant.USER_LOGIN_CACHE_SALT);
        LoginInfoEntity user;
        if (obj == null) {
            log.info("从缓存中获取access-token失败... 从服务端获取此用户的登录信息进行验证......");
            user = userService.getUserLoginInfo(userName);
            if (user == null) {
                log.error("access-token验证失败... cur user is {}......", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TOKEN_NON_ERROR);
            }
        } else {
            log.info("从缓存中获取用户登录信息成功......");
            user = (LoginInfoEntity) obj;
        }
        jwtVerifierUser(user, token);
        log.info("<<<access-token验证成功>>>");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest,
                           HttpServletResponse httpServletResponse,
                           Object o, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest,
                                HttpServletResponse httpServletResponse,
                                Object o, Exception e) throws Exception {
    }

    private void jwtVerifierUser(LoginInfoEntity user, String token) throws GeneralException {
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(user.getToken())).build();
        try {
            jwtVerifier.verify(token);
        } catch (JWTVerificationException e) {
            log.error("access-token验证失败... cur user is {}......", user.getUserName());
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TOKEN_NON_ERROR);
        }
    }
}
