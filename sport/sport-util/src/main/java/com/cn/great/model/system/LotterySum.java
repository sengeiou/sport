package com.cn.great.model.system;

import java.math.BigDecimal;
import java.util.Date;

public class LotterySum {
    private Integer id;

    private Integer agentsId;

    private Integer userid;

    private Integer nums;

    private Date date;

    private BigDecimal userWin;

    private BigDecimal betsMoney;

    private BigDecimal validMoney;

    private String serverAdmin;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAgentsId() {
        return agentsId;
    }

    public void setAgentsId(Integer agentsId) {
        this.agentsId = agentsId;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getNums() {
        return nums;
    }

    public void setNums(Integer nums) {
        this.nums = nums;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public BigDecimal getUserWin() {
        return userWin;
    }

    public void setUserWin(BigDecimal userWin) {
        this.userWin = userWin;
    }

    public BigDecimal getBetsMoney() {
        return betsMoney;
    }

    public void setBetsMoney(BigDecimal betsMoney) {
        this.betsMoney = betsMoney;
    }

    public BigDecimal getValidMoney() {
        return validMoney;
    }

    public void setValidMoney(BigDecimal validMoney) {
        this.validMoney = validMoney;
    }

    public String getServerAdmin() {
        return serverAdmin;
    }

    public void setServerAdmin(String serverAdmin) {
        this.serverAdmin = serverAdmin == null ? null : serverAdmin.trim();
    }
}