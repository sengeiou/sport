package com.cn.great.model.system;

import java.util.Date;

public class ActivityCondition {
    private Integer id;

    private String name;

    private Object condition;

    private Object white;

    private String black;

    private String beta;

    private Date startTime;

    private Date endTime;

    private Integer total;

    private Integer getMoney;

    private Boolean status;

    private String serverAdmin;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Object getCondition() {
        return condition;
    }

    public void setCondition(Object condition) {
        this.condition = condition;
    }

    public Object getWhite() {
        return white;
    }

    public void setWhite(Object white) {
        this.white = white;
    }

    public String getBlack() {
        return black;
    }

    public void setBlack(String black) {
        this.black = black == null ? null : black.trim();
    }

    public String getBeta() {
        return beta;
    }

    public void setBeta(String beta) {
        this.beta = beta == null ? null : beta.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getGetMoney() {
        return getMoney;
    }

    public void setGetMoney(Integer getMoney) {
        this.getMoney = getMoney;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getServerAdmin() {
        return serverAdmin;
    }

    public void setServerAdmin(String serverAdmin) {
        this.serverAdmin = serverAdmin == null ? null : serverAdmin.trim();
    }
}