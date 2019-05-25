package com.cn.great.model.common;

import com.cn.great.enums.ResponseCodeEnum;
import lombok.Data;

/**
 * @program: meet
 * @description: 错误响应类
 * @author: Stamp.M
 * @create: 2019-03-19 22:33
 **/
@Data
public class ErrorResponse {
    private Integer result;
    private String error_msg;
    private Integer error_code;

    public ErrorResponse(String error_msg, Integer error_code) {
        this.result = 1;
        this.error_msg = error_msg;
        this.error_code = error_code;
    }

    public ErrorResponse(Integer result, String error_msg, Integer error_code){
        this.result = result;
        this.error_msg = error_msg;
        this.error_code = error_code;
    }

    //错误响应
    public static ErrorResponse initErrorResponse(String error_msg, Integer error_code) {
        return new ErrorResponse(error_msg, error_code);
    }

    //错误响应
    public static ErrorResponse initErrorResponseEntity(ResponseCodeEnum responseCodeEnum) {
        return new ErrorResponse(responseCodeEnum.getMessage(), responseCodeEnum.getCode());
    }

    //正常响应
    public static ErrorResponse initNormalResponseEntity(ResponseCodeEnum responseCodeEnum){
        return new ErrorResponse(0, responseCodeEnum.getMessage(), responseCodeEnum.getCode());
    }

}
