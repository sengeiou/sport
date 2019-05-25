package com.cn.great.common;


import com.cn.great.handler.BodyRequestWrapper;
import com.cn.great.handler.GetRequestWrapper;
import com.cn.great.util.IPUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @program: sport
 * @description: 请求处理过滤器
 * @author: Stamp.M
 * @create: 2019-03-19 21:42
 **/
@Slf4j
@WebFilter(filterName = "requestWrapperFilter", urlPatterns = {"/*"})
public class RequestWrapperFilter implements Filter {

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
        BodyRequestWrapper bodyRequestWrapper = null;
        GetRequestWrapper requestWrapper = null;
        if (StringUtils.equals(methodType, "POST")) {
            bodyRequestWrapper = new BodyRequestWrapper((HttpServletRequest) request);
            chain.doFilter(bodyRequestWrapper, response);
        } else if (StringUtils.equals(methodType, "GET")) {
            requestWrapper = new GetRequestWrapper((HttpServletRequest) request);
            chain.doFilter(requestWrapper, response);
        }
    }

    @Override
    public void destroy() {
    }
}
