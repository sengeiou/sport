package com.cn.great.req.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

/**
 * @program: sport
 * @description: 用户注册请求Req
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class RegisterReq {
    //用户名
    @NotBlank
    @Pattern(regexp = "^[a-zA-Z0-9]{6,15}$")
    private String username;
    //密码
    @NotBlank
    @Pattern(regexp = "^[a-zA-Z0-9]{6,15}$")
    private String password;
    //真实姓名
    @NotBlank
    private String alias;
    //提款密码
    @NotBlank
    @Pattern(regexp = "^\\d{6}$")
    private String withdrawal_passwd;
    //密保问题ID，对应密保字典ID
    @NotBlank
    private Integer question;
    //密保问题答案
    @NotBlank
    private String answer;
    //验证码
    @NotBlank
    private String RegisterCaptcha;
    //推荐的代理账号
    @Pattern(regexp = "^[a-zA-Z0-9]{6,15}$")
    private String agents;
    //生日
    private String birthday;
}
