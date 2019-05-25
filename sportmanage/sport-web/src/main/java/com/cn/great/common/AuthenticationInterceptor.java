package com.cn.great.common;

import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.Constant;
import com.cn.great.util.GeneralUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

/**
 * @program: sport
 * @description: access-token校验
 * @author: Stamp
 * @create: 2019-03-31 10:40
 **/
@Slf4j
@Component
public class AuthenticationInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws GeneralException, IOException, ServletException {
        // session过期拦截
        Object obj = request.getSession().getAttribute(Constant.USER_SESSION_NAME);
        boolean isAjax = GeneralUtils.isAjaxRequest(request);
        if(obj == null) {
            return setResponseSessionOutHeader(request, response, isAjax);
        }
        String method = request.getMethod();
        String url = request.getRequestURI();
        log.info("开始权限验证... cur method {}; cur requestUrl is {};", method, url);
        Object authUrls = request.getSession().getAttribute(Constant.AUTHS_ALL_SESSION);
        if(authUrls != null){
            Set<String> auths = (Set<String>)authUrls;
            if(auths.contains(url)){
                Object owenAuths = request.getSession().getAttribute(Constant.AUTH_OWEN_SESSION);
                if(owenAuths == null){
                    return setResponseNoPermHeader(request, response, isAjax);
                }else{
                    Set<String> owens = (Set<String>)owenAuths;
                    if(!owens.contains(url))
                        return setResponseNoPermHeader(request, response, isAjax);
                }
            }
        }
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

    private boolean setResponseSessionOutHeader(HttpServletRequest request, HttpServletResponse response, boolean isAjax) throws IOException{
        if(isAjax){
            response.setHeader("sessionStatus", "timeout");
        }else{
            response.sendRedirect(request.getContextPath()+"/goLogin");
        }
        return false;
    }

    private boolean setResponseNoPermHeader(HttpServletRequest request, HttpServletResponse response, boolean isAjax) throws IOException{
        if(isAjax){
            response.setHeader("noPermission", "yes");
        }else{
            response.sendRedirect(request.getContextPath()+"/noPerm");
        }
        return false;
    }
}
