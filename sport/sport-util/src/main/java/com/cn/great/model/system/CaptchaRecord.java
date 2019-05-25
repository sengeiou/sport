package com.cn.great.model.system;

public class CaptchaRecord {
    private String username;

    private String captext;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getCaptext() {
        return captext;
    }

    public void setCaptext(String captext) {
        this.captext = captext == null ? null : captext.trim();
    }
}