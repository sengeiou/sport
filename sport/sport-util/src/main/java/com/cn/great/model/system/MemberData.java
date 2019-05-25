package com.cn.great.model.system;

import java.math.BigDecimal;

public class MemberData {
    private Integer id;

    private String username;

    private BigDecimal money;

    private BigDecimal money2;

    private Integer agentsId;

    private Integer ctime;

    private BigDecimal cmoney;

    private Integer ttime;

    private BigDecimal tmoney;

    private Long sumBet;

    private String password;

    private Integer levelId;

    private String notesWithdrawal;

    private Boolean status;

    private String serverAdmin;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getMoney2() {
        return money2;
    }

    public void setMoney2(BigDecimal money2) {
        this.money2 = money2;
    }

    public Integer getAgentsId() {
        return agentsId;
    }

    public void setAgentsId(Integer agentsId) {
        this.agentsId = agentsId;
    }

    public Integer getCtime() {
        return ctime;
    }

    public void setCtime(Integer ctime) {
        this.ctime = ctime;
    }

    public BigDecimal getCmoney() {
        return cmoney;
    }

    public void setCmoney(BigDecimal cmoney) {
        this.cmoney = cmoney;
    }

    public Integer getTtime() {
        return ttime;
    }

    public void setTtime(Integer ttime) {
        this.ttime = ttime;
    }

    public BigDecimal getTmoney() {
        return tmoney;
    }

    public void setTmoney(BigDecimal tmoney) {
        this.tmoney = tmoney;
    }

    public Long getSumBet() {
        return sumBet;
    }

    public void setSumBet(Long sumBet) {
        this.sumBet = sumBet;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getLevelId() {
        return levelId;
    }

    public void setLevelId(Integer levelId) {
        this.levelId = levelId;
    }

    public String getNotesWithdrawal() {
        return notesWithdrawal;
    }

    public void setNotesWithdrawal(String notesWithdrawal) {
        this.notesWithdrawal = notesWithdrawal == null ? null : notesWithdrawal.trim();
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