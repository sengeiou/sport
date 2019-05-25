package com.cn.great.exception;

import com.cn.great.enums.ResponseCodeEnum;

/**
 * @program: sport
 * @description: 自定义异常
 * @author: Stamp.M
 * @create: 2019-03-19 22:19
 **/
public class GeneralException extends RuntimeException {
    private Integer code;

    public GeneralException(String message, Integer code) {
        super(message);
        this.code = code;
    }

    public GeneralException(ResponseCodeEnum responseCodeEnum) {
        super(responseCodeEnum.getMessage());
        this.code = responseCodeEnum.getCode();
    }

    public static GeneralException initEnumGeneralException(ResponseCodeEnum responseCodeEnum) {
        return new GeneralException(responseCodeEnum.getMessage(), responseCodeEnum.getCode());
    }
    public static GeneralException initEnumGeneralException(Integer code,String msg) {
        return new GeneralException(msg, code);
    }
    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return super.getMessage();
    }

}
