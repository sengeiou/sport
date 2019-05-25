package com.cn.great.req.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @program: sport
 * @description: 用户登录请求Req
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class AgLoginReq {
    //用户名
    @NotNull
    private Integer actype;
    //密码
    @NotNull
    private Integer terminal;

    @NotNull
    private Integer gameType;

    private String dm;
}
