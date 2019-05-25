package com.cn.great.model.user;

/**
 * @program: sport
 * @description: 用户token类
 * @author: Stamp
 * @create: 2019-03-31 10:45
 **/
public class UserToken {
    private String token;
    private String userName;


    public String getToken() {
        return token;
    }
    public void setToken(String token) {
        this.token = token;
    }
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
