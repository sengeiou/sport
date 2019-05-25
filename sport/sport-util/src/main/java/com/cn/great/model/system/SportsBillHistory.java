package com.cn.great.model.system;

import java.math.BigDecimal;
import java.util.Date;

public class SportsBillHistory {
    private Long id;

    private String mid;

    private Integer userid;

    private String username;

    private Byte active;

    private Byte linetype;

    private String mtype;

    private Boolean payType;

    private Date mDate;

    private Date bettime;

    private BigDecimal gold;

    private String mPlace;

    private String mRate;

    private BigDecimal gwin;

    private BigDecimal mResult;

    private String showType;

    private Boolean cancel;

    private String type;

    private String ptype;

    private String gtype;

    private Integer mbMid;

    private Integer tgMid;

    private Byte mbBall;

    private Byte tgBall;

    private Boolean checked;

    private Byte confirmed;

    private Boolean danger;

    private String score;

    private BigDecimal lastBetMoney;

    private String serverAdmin;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid == null ? null : mid.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Byte getActive() {
        return active;
    }

    public void setActive(Byte active) {
        this.active = active;
    }

    public Byte getLinetype() {
        return linetype;
    }

    public void setLinetype(Byte linetype) {
        this.linetype = linetype;
    }

    public String getMtype() {
        return mtype;
    }

    public void setMtype(String mtype) {
        this.mtype = mtype == null ? null : mtype.trim();
    }

    public Boolean getPayType() {
        return payType;
    }

    public void setPayType(Boolean payType) {
        this.payType = payType;
    }

    public Date getmDate() {
        return mDate;
    }

    public void setmDate(Date mDate) {
        this.mDate = mDate;
    }

    public Date getBettime() {
        return bettime;
    }

    public void setBettime(Date bettime) {
        this.bettime = bettime;
    }

    public BigDecimal getGold() {
        return gold;
    }

    public void setGold(BigDecimal gold) {
        this.gold = gold;
    }

    public String getmPlace() {
        return mPlace;
    }

    public void setmPlace(String mPlace) {
        this.mPlace = mPlace == null ? null : mPlace.trim();
    }

    public String getmRate() {
        return mRate;
    }

    public void setmRate(String mRate) {
        this.mRate = mRate == null ? null : mRate.trim();
    }

    public BigDecimal getGwin() {
        return gwin;
    }

    public void setGwin(BigDecimal gwin) {
        this.gwin = gwin;
    }

    public BigDecimal getmResult() {
        return mResult;
    }

    public void setmResult(BigDecimal mResult) {
        this.mResult = mResult;
    }

    public String getShowType() {
        return showType;
    }

    public void setShowType(String showType) {
        this.showType = showType == null ? null : showType.trim();
    }

    public Boolean getCancel() {
        return cancel;
    }

    public void setCancel(Boolean cancel) {
        this.cancel = cancel;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype == null ? null : ptype.trim();
    }

    public String getGtype() {
        return gtype;
    }

    public void setGtype(String gtype) {
        this.gtype = gtype == null ? null : gtype.trim();
    }

    public Integer getMbMid() {
        return mbMid;
    }

    public void setMbMid(Integer mbMid) {
        this.mbMid = mbMid;
    }

    public Integer getTgMid() {
        return tgMid;
    }

    public void setTgMid(Integer tgMid) {
        this.tgMid = tgMid;
    }

    public Byte getMbBall() {
        return mbBall;
    }

    public void setMbBall(Byte mbBall) {
        this.mbBall = mbBall;
    }

    public Byte getTgBall() {
        return tgBall;
    }

    public void setTgBall(Byte tgBall) {
        this.tgBall = tgBall;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public Byte getConfirmed() {
        return confirmed;
    }

    public void setConfirmed(Byte confirmed) {
        this.confirmed = confirmed;
    }

    public Boolean getDanger() {
        return danger;
    }

    public void setDanger(Boolean danger) {
        this.danger = danger;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score == null ? null : score.trim();
    }

    public BigDecimal getLastBetMoney() {
        return lastBetMoney;
    }

    public void setLastBetMoney(BigDecimal lastBetMoney) {
        this.lastBetMoney = lastBetMoney;
    }

    public String getServerAdmin() {
        return serverAdmin;
    }

    public void setServerAdmin(String serverAdmin) {
        this.serverAdmin = serverAdmin == null ? null : serverAdmin.trim();
    }
}