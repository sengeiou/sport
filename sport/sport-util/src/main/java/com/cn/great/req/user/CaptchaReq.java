package com.cn.great.req.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @program: sport
 * @description: 验证码请求参数
 * @author: Stamp
 * @create: 2019-04-03 09:44
 **/
@Data
public class CaptchaReq {
    // 用户名
    private String username;
    // 返回验证码类型
    @NotBlank
    private String type;

}
