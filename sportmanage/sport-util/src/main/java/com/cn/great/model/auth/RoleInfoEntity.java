package com.cn.great.model.auth;


import lombok.Data;

import java.io.Serializable;

/**
 * @program: sportmanage
 * @description: 角色管理实体类
 * @author: Stamp
 * @create: 2019-04-14 13:11
 **/
@Data
public class RoleInfoEntity implements Serializable {
    private static final long serialVersionUID = -1361240563474756488L;
    private Integer id;
    private String roleNameCN;
    private String roleNameEN;
    private String roleDesc;
}
