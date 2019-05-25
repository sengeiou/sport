package com.cn.great.model.system;

import lombok.Data;

@Data
public class MessageInfoEntity {
    private Integer id;

    private Integer messageId;

    private String userid;

    private Boolean readStatus;

    private Boolean delStatus;

    private String username;
}