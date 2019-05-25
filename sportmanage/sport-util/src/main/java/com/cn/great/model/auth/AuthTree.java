package com.cn.great.model.auth;

import lombok.Data;

/**
 * @program: sportmanage
 * @description: 权限树显示
 * @author: Stamp
 * @create: 2019-04-16 10:52
 **/
@Data
public class AuthTree {
    private String id;
    private String name;
    private String pId;


}
