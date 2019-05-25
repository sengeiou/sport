package com.cn.great.req.auth;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: sportmanage
 * @description: 管理员查询
 * @author: Stamp
 * @create: 2019-04-10 09:03
 **/
@Data
public class AuthReq extends BaseEntity {

    private String authNameCN;
    private String authNameEN;
    private Integer authType;
    private Integer parent;
}
