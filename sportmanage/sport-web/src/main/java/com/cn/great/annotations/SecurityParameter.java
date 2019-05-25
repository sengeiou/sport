package com.cn.great.annotations;

import org.springframework.web.bind.annotation.Mapping;
import java.lang.annotation.*;

/** 
* @Description: 请求数据解密
* @Author: Stamp.M 
* @Date: 2019/3/19 
*/ 
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Mapping
@Documented
public @interface SecurityParameter {

    /**
     * 入参是否解密，默认非解密
     */
    boolean inDecode() default false;

    /**
     * 出参是否加密，默认非加密
     */
    boolean outEncode() default false;
}
