package com.cn.great.model.system;

import java.util.Date;

public class MatchCrownFt {
    private Integer id;

    private Integer mid;

    private Date mStart;

    private String mbTeam;

    private String mbTeamTw;

    private String mbTeamEn;

    private String mLeague;

    private String mLeagueTw;

    private String mLeagueEn;

    private String mItem;

    private String mItemTw;

    private String mItemEn;

    private Double mRate;

    private String gid;

    private Integer mcount;

    private String mshow;

    private Boolean win;

    private String mshow2;

    private Date uptime;

    private Boolean score;

    private Boolean cancel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Date getmStart() {
        return mStart;
    }

    public void setmStart(Date mStart) {
        this.mStart = mStart;
    }

    public String getMbTeam() {
        return mbTeam;
    }

    public void setMbTeam(String mbTeam) {
        this.mbTeam = mbTeam == null ? null : mbTeam.trim();
    }

    public String getMbTeamTw() {
        return mbTeamTw;
    }

    public void setMbTeamTw(String mbTeamTw) {
        this.mbTeamTw = mbTeamTw == null ? null : mbTeamTw.trim();
    }

    public String getMbTeamEn() {
        return mbTeamEn;
    }

    public void setMbTeamEn(String mbTeamEn) {
        this.mbTeamEn = mbTeamEn == null ? null : mbTeamEn.trim();
    }

    public String getmLeague() {
        return mLeague;
    }

    public void setmLeague(String mLeague) {
        this.mLeague = mLeague == null ? null : mLeague.trim();
    }

    public String getmLeagueTw() {
        return mLeagueTw;
    }

    public void setmLeagueTw(String mLeagueTw) {
        this.mLeagueTw = mLeagueTw == null ? null : mLeagueTw.trim();
    }

    public String getmLeagueEn() {
        return mLeagueEn;
    }

    public void setmLeagueEn(String mLeagueEn) {
        this.mLeagueEn = mLeagueEn == null ? null : mLeagueEn.trim();
    }

    public String getmItem() {
        return mItem;
    }

    public void setmItem(String mItem) {
        this.mItem = mItem == null ? null : mItem.trim();
    }

    public String getmItemTw() {
        return mItemTw;
    }

    public void setmItemTw(String mItemTw) {
        this.mItemTw = mItemTw == null ? null : mItemTw.trim();
    }

    public String getmItemEn() {
        return mItemEn;
    }

    public void setmItemEn(String mItemEn) {
        this.mItemEn = mItemEn == null ? null : mItemEn.trim();
    }

    public Double getmRate() {
        return mRate;
    }

    public void setmRate(Double mRate) {
        this.mRate = mRate;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid == null ? null : gid.trim();
    }

    public Integer getMcount() {
        return mcount;
    }

    public void setMcount(Integer mcount) {
        this.mcount = mcount;
    }

    public String getMshow() {
        return mshow;
    }

    public void setMshow(String mshow) {
        this.mshow = mshow == null ? null : mshow.trim();
    }

    public Boolean getWin() {
        return win;
    }

    public void setWin(Boolean win) {
        this.win = win;
    }

    public String getMshow2() {
        return mshow2;
    }

    public void setMshow2(String mshow2) {
        this.mshow2 = mshow2 == null ? null : mshow2.trim();
    }

    public Date getUptime() {
        return uptime;
    }

    public void setUptime(Date uptime) {
        this.uptime = uptime;
    }

    public Boolean getScore() {
        return score;
    }

    public void setScore(Boolean score) {
        this.score = score;
    }

    public Boolean getCancel() {
        return cancel;
    }

    public void setCancel(Boolean cancel) {
        this.cancel = cancel;
    }
}