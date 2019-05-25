package com.cn.great.req.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

/**
 * @program: sport
 * @description: 修改提款密码请求参数
 * @author: Stamp
 * @create: 2019-04-03 09:44
 **/
@Data
public class PayPasswordReq {
    // 旧密码
    @NotBlank
    @Pattern(regexp = "^[a-zA-Z0-9]{6,15}$")
    private String password;
    // 新密码
    @NotBlank
    @Pattern(regexp = "^[a-zA-Z0-9]{6,15}$")
    private String newPassword;

}
