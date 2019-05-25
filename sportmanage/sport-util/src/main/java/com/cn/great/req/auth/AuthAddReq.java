package com.cn.great.req.auth;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * @program: sportmanage
 * @description: 权限配置管理类
 * @author: Stamp
 * @create: 2019-04-14 13:03
 **/
@Data
public class AuthAddReq extends BaseEntity {
    @NotBlank
    private String authNameCN;
    @NotBlank
    private String authNameEN;
    @NotBlank
    private Integer authType;
    private String authDesc;
    private String authUrl;
    private Integer parent;
}
