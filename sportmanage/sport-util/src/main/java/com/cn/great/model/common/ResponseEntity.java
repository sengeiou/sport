package com.cn.great.model.common;

import lombok.Data;

/**
 * @program: meet
 * @description: 一般正常响应类
 * @author: Stamp.M
 * @create: 2019-03-19 22:33
 **/
@Data
public class ResponseEntity<T> {
    private Integer result;
    private String error_msg;
    private T data;
    private Integer recordsTotal;
    private Integer recordsFiltered;

    public ResponseEntity(String message) {
        this.result = 0;
        this.error_msg = message;
    }

    public ResponseEntity(String message, T data) {
        this.result = 0;
        this.error_msg = message;
        this.data = data;
    }

    public ResponseEntity(T data, Integer recordsTotal) {
        this.result = 0;
        this.error_msg = "";
        this.data = data;
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsTotal;
    }

    public static ResponseEntity initGeneralSuccessResponse(){
        return new ResponseEntity("success", "");
    }

    public static ResponseEntity initGeneralResponseMsg(String message) {
        return new ResponseEntity(message, "");
    }

    public static ResponseEntity initGeneralResponseObj(String message, Object data) {
        return new ResponseEntity(message, data);
    }

    public static ResponseEntity initGeneralResponseRes(Object data, Integer recordsTotal) {
        return new ResponseEntity(data, recordsTotal);
    }


}
