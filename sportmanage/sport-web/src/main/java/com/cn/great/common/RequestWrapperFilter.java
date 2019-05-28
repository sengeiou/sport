package com.cn.great.common;


import com.alibaba.fastjson.JSON;
import com.cn.great.handler.BodyRequestWrapper;
import com.cn.great.handler.GetRequestWrapper;
import com.cn.great.model.common.Constant;
import com.cn.great.model.user.AdminInfoEntity;
import com.cn.great.req.system.LogOpeReq;
import com.cn.great.service.LogService;
import com.cn.great.util.GeneralUtils;
import com.cn.great.util.IPUtils;
import com.google.common.collect.ImmutableList;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: sport
 * @description: 请求处理过滤器
 * @author: Stamp.M
 * @create: 2019-03-19 21:42
 **/
@Slf4j
@WebFilter(filterName = "requestWrapperFilter", urlPatterns = {"/*"})
public class RequestWrapperFilter implements Filter {

    //非日志记录请求路径集合
    ImmutableList excludeTokenPaths = ImmutableList.of("/", "/goLogin", "/admin/roles", "/log/logList");

    @Resource
    private LogService logService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String methodType = httpServletRequest.getMethod();
        String servletPath = httpServletRequest.getRequestURI();
        // 获取请求全IP地址
        String ip = IPUtils.getRealIp((HttpServletRequest) request, 1);
        log.info(" HttpServletRequest: IP:{}, MethodType:{}, ServletPath:{}", ip, methodType, servletPath);
        Object obj = httpServletRequest.getSession().getAttribute(Constant.LOGIN_INFO_SESSION);
        String params = "";
        BodyRequestWrapper bodyRequestWrapper = null;
        GetRequestWrapper requestWrapper = null;
        if (StringUtils.equals(methodType, "POST")) {
            bodyRequestWrapper = new BodyRequestWrapper((HttpServletRequest) request);
            params = bodyRequestWrapper.getJson();
            if (obj != null && !servletPath.contains("/static/")
                    && !excludeTokenPaths.contains(servletPath)
                    && !servletPath.contains("Page")) {
                AdminInfoEntity user = (AdminInfoEntity) obj;
                LogOpeReq logOpeReq = GeneralUtils.generateLogOpe(user, ip, servletPath, params);
                logService.addLogInfo(logOpeReq);
            }
            chain.doFilter(bodyRequestWrapper, response);
        } else if (StringUtils.equals(methodType, "GET")) {
            requestWrapper = new GetRequestWrapper((HttpServletRequest) request);
            Map<String, String[]> map = requestWrapper.getParameterMap();
            Map<String, String[]> paramMap = new HashMap<>();
            paramMap.putAll(map);
            if (!CollectionUtils.isEmpty(paramMap)) {
                paramMap.remove("authOwenUrls");
                paramMap.remove("loginName");
                if (!CollectionUtils.isEmpty(paramMap)) {
                    params = JSON.toJSONString(paramMap);
                }
            }
            if (obj != null && !servletPath.contains("/static/")
                    && !excludeTokenPaths.contains(servletPath)
                    && !servletPath.contains("Page")) {
                AdminInfoEntity user = (AdminInfoEntity) obj;
                LogOpeReq logOpeReq = GeneralUtils.generateLogOpe(user, ip, servletPath, params);
                logService.addLogInfo(logOpeReq);
            }
            chain.doFilter(requestWrapper, response);
        }
    }

    @Override
    public void destroy() {
    }

}
