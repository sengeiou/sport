package com.cn.great.req.message;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class MessageReq {

    //消息id
    @NotBlank
    private int id;
    //消息
    @NotBlank
    private String context;
    //发送人
    @NotBlank
    private int toUser;

}
