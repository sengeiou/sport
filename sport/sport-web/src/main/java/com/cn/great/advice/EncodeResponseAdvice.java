package com.cn.great.advice;


import com.cn.great.annotations.SecurityParameter;
import com.cn.great.util.GeneralUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

/**
 * @program: sport
 * @description: 响应数据是否加密
 * @author: Stamp.M
 * @create: 2019-03-19 22:05
 **/
@ControllerAdvice(basePackages = "com.cn.great.controller")
@Slf4j
public class EncodeResponseAdvice implements ResponseBodyAdvice {

    @Override
    public boolean supports(MethodParameter methodParameter, Class aClass) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter methodParameter, MediaType mediaType, Class aClass, ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
        boolean encode = false;
        if (methodParameter.getMethod().isAnnotationPresent(SecurityParameter.class)) {
            SecurityParameter serializedField = methodParameter.getMethodAnnotation(SecurityParameter.class);
            encode = serializedField.outEncode();
        }
        if (encode) {
            log.info("对方法method :【" + methodParameter.getMethod().getName() + "】返回数据进行加密");
            return GeneralUtils.encryptRes(body);
        }
        return body;
    }
}