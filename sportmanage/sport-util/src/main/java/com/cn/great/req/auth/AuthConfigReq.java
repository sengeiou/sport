package com.cn.great.req.auth;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: sportmanage
 * @description: 权限配置
 * @author: Stamp
 * @create: 2019-04-16 14:20
 **/
@Data
public class AuthConfigReq extends BaseEntity {
    private String authIds;
    private String roleId;
}
