package com.cn.great.model.system;

import java.util.Date;

public class LoginLog {
    private Integer id;

    private Integer userid;

    private Date addTime;

    private String url;

    private Long ip;

    private String serverAdmin;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Long getIp() {
        return ip;
    }

    public void setIp(Long ip) {
        this.ip = ip;
    }

    public String getServerAdmin() {
        return serverAdmin;
    }

    public void setServerAdmin(String serverAdmin) {
        this.serverAdmin = serverAdmin == null ? null : serverAdmin.trim();
    }
}