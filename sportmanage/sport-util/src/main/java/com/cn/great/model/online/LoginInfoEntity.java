package com.cn.great.model.online;

import lombok.Data;

import java.io.Serializable;

/**
 * @program: sport
 * @description: 登录登出信息类 对应 web_login_info表
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class LoginInfoEntity implements Serializable {

    private static final long serialVersionUID = -417879226116854762L;
    private Integer id;
    // 用户ID
    private Integer userId;
    //用户名
    private String userName;
    // 状态 0-登出，1-登陆
    private String online;
    // 0-会员1-代理2-管理员
    private Integer type;
    // 登陆时间
    private String loginTime;
    // 登陆IP
    private String loginIp;
    // 登陆地址
    private String loginUrl;
    // 最后在线时间
    private String onlineTime;
    // 登出时间
    private String logoutTime;
    // 登录token
    private String token;

}
