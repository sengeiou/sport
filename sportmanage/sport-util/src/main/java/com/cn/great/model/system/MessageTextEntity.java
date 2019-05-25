package com.cn.great.model.system;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class MessageTextEntity {
    
    private Integer id;

    private int fromUser;

    private String title;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") //Jackson包使用注解
    private Date addTime;

    private Boolean status;

    private String toUser;

    private Boolean fromType;

    private Integer replyId;

    private String serverAdmin;

    private String context;

    private String fromUserName;
    private String toUserName;

    private List<MessageInfoEntity> infos;
}