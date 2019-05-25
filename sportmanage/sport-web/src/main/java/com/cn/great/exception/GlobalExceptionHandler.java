package com.cn.great.exception;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.model.common.ErrorResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import java.util.Set;

/**
 * @program: sport
 * @description: 全局异常处理
 * @author: Stamp.M
 * @create: 2019-03-19 22:22
 **/
@Slf4j
@Component
@ControllerAdvice
public class GlobalExceptionHandler {

    /**
     * @Description: 处理 Exception 异常
     * @Param: [e]
     * @return: com.cn.great.model.common.ErrorResponse
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public ErrorResponse exceptionHandler(Exception e) {
        e.printStackTrace();
        log.error("服务错误:", e.getMessage());
        return ErrorResponse.initErrorResponseEntity(ResponseCodeEnum.INNER_ERROR);
    }

    @ExceptionHandler
    @ResponseBody
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ErrorResponse handle(ValidationException exception) {
        if (exception instanceof ConstraintViolationException) {
            ConstraintViolationException exs = (ConstraintViolationException) exception;
            Set<ConstraintViolation<?>> violations = exs.getConstraintViolations();
            for (ConstraintViolation<?> item : violations) {
                log.error("参数验证错误, {} ", item.getMessage());
            }
        }
        return ErrorResponse.initErrorResponseEntity(ResponseCodeEnum.FIELD_NOT_STANDARD_ERROR);
    }


    /**
     * @Description: 验证异常处理
     * @Param: [exception]
     * @return: com.cn.great.model.common.ErrorResponse
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    @ExceptionHandler(BindException.class)
    @ResponseBody
    public ErrorResponse handle(BindException e) {
        String errMsg = e.getAllErrors().get(0).getDefaultMessage();
        log.info("参数验证错误, {}", errMsg);
        //"字段不符合规范"错误
        return ErrorResponse.initErrorResponseEntity(ResponseCodeEnum.FIELD_NOT_STANDARD_ERROR);
    }

    /**
     * @Description: 验证异常处理
     * @Param: [exception]
     * @return: com.cn.great.model.common.ErrorResponse
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseBody
    public ErrorResponse handle(MethodArgumentNotValidException e) {
        String errMsg = e.getMessage();
        log.info("参数验证错误, {}", errMsg);
        //"字段不符合规范"错误
        return ErrorResponse.initErrorResponseEntity(ResponseCodeEnum.FIELD_NOT_STANDARD_ERROR);
    }


    /**
     * @Description: 业务异常处理
     * @Param: [httpServletRequest, e]
     * @return: com.cn.great.model.common.ErrorResponse
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    @ResponseBody
    @ExceptionHandler(value = GeneralException.class)
    public ErrorResponse businessExceptionHandler(GeneralException e) {
        log.info("业务处理异常...code : " + e.getCode() + "; msg:" + e.getMessage());
        return ErrorResponse.initErrorResponse(e.getMessage(), e.getCode());
    }
}
