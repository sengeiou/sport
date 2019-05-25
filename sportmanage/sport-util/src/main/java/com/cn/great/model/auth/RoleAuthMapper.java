package com.cn.great.model.auth;

import lombok.Data;

import java.io.Serializable;

/**
 * @program: sportmanage
 * @description: 角色权限映射表
 * @author: Stamp
 * @create: 2019-04-16 13:16
 **/
@Data
public class RoleAuthMapper implements Serializable {
    private Integer roleId;
    private Integer authId;
}
