package com.cn.great.annotations;

import org.springframework.web.bind.annotation.Mapping;

import java.lang.annotation.*;

/** 
* @Description: 必填参数校验注解
* @Author: Stamp.M 
* @Date: 2019/3/19 
*/ 
@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Mapping
@Documented
public @interface ParamCheck {
    /**
     * 参数是否必填，默认必填
     */
    boolean isNeed() default true;
}
