package com.cn.great.req.auth;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: sportmanage
 * @description: 角色查询
 * @author: Stamp
 * @create: 2019-04-10 09:03
 **/
@Data
public class RoleReq extends BaseEntity {

    private String roleNameCN;
    private String roleNameEN;
    private String roleDesc;
}
