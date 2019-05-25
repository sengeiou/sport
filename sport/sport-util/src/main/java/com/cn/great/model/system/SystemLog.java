package com.cn.great.model.system;

import java.util.Date;

public class SystemLog {
    private Integer id;

    private Integer adminId;

    private Long ip;

    private Date datetime;

    private Boolean type;

    private String serverAdmin;

    private String context;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Long getIp() {
        return ip;
    }

    public void setIp(Long ip) {
        this.ip = ip;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public String getServerAdmin() {
        return serverAdmin;
    }

    public void setServerAdmin(String serverAdmin) {
        this.serverAdmin = serverAdmin == null ? null : serverAdmin.trim();
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context == null ? null : context.trim();
    }
}