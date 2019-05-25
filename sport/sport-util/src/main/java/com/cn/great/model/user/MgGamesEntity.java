package com.cn.great.model.user;

import lombok.Data;

@Data
public class MgGamesEntity {
    private Integer id;

    private Integer gameItemId;

    private Integer swaAppId;

    private Integer h5ItemId;

    private Integer h5AppId;

    private String gameName;

    private String nameCn;

    private String gameCategory;

    private String gameCategory2;

    private String gameCategory3;

    private String gameImg;

    private Boolean isCn;

    private Boolean flash;

    private Boolean isHtml5;
}