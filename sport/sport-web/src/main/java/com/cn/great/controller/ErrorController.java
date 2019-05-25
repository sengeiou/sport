package com.cn.great.controller;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.handler.BodyRequestWrapper;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ErrorResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: sport
 * @description: 异常响应
 * @author: Stamp.M
 * @create: 2019-03-22 22:36
 **/

@RestController
@RequestMapping("/error")
public class ErrorController {

    /**
     * @Description: 错误响应类
     * @Param: [request]
     * @return: com.cn.meet.model.common.ResponseEntity
     * @Author: Stamp.M
     * @Date: 2019/3/22
     */
    @RequestMapping("/msg")
    public ErrorResponse error(BodyRequestWrapper request) throws GeneralException {
        ResponseCodeEnum codeEnum = (ResponseCodeEnum) request.getSession().getAttribute(Constant.ERROR_SESSION_ENUM);
        return ErrorResponse.initErrorResponseEntity(codeEnum);
    }
}
