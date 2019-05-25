package com.cn.great.model.auth;

import lombok.Data;

import java.io.Serializable;

/**
 * @program: sportmanage
 * @description: 权限配置管理类
 * @author: Stamp
 * @create: 2019-04-14 13:03
 **/
@Data
public class AuthInfoEntity implements Serializable {

    private static final long serialVersionUID = -2530905402994128217L;
    private Integer id;
    private String authNameCN;
    private String authNameEN;
    private Integer authType;
    private String authDesc;
    private String authUrl;
    private Integer parent;
}
