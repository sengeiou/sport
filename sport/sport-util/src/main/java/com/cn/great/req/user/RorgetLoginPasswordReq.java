package com.cn.great.req.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @program: sport
 * @description: 密码找回请求Req
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class RorgetLoginPasswordReq {

    // 	1->通过密保找回, 置空->通过提款密码找回
    private String type;
    //用户名规则和注册规则一样
    @NotBlank
    private String userName;
    //密保问题ID
    private Integer question;
    //密保答案
    private String answer;
    //新密码
    @NotBlank
    private String newPassword;
    // 提款密码
    private String password;
}
