package com.cn.great.model.match;

import lombok.Data;

@Data
public class SportsShieldEntity {
    private Integer id;

    private Integer mId;

    private String mleague;

    private String mbteam;

    private String tgteam;

    private String sporttype;

    private Byte type;

    private String serverAdmin;
}