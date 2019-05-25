package com.cn.great.req.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @program: sport
 * @description: 用户登录请求Req
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class LoginReq {
    //用户名
    @NotBlank
    private String userName;
    //密码
    @NotBlank
    private String password;
}
