package com.cn.great.model.system;

import java.util.Date;

public class SportsBifen {
    private Integer mid;

    private Integer mleagueid;

    private String type;

    private String mleague;

    private String mbteam;

    private String tgteam;

    private Date mdate;

    private String datetimes;

    private String scorefirsthalf;

    private String scorefullcourt;

    private Object all;

    private String score1;

    private String score2;

    private String score3;

    private String score4;

    private Boolean status;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getMleagueid() {
        return mleagueid;
    }

    public void setMleagueid(Integer mleagueid) {
        this.mleagueid = mleagueid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getMleague() {
        return mleague;
    }

    public void setMleague(String mleague) {
        this.mleague = mleague == null ? null : mleague.trim();
    }

    public String getMbteam() {
        return mbteam;
    }

    public void setMbteam(String mbteam) {
        this.mbteam = mbteam == null ? null : mbteam.trim();
    }

    public String getTgteam() {
        return tgteam;
    }

    public void setTgteam(String tgteam) {
        this.tgteam = tgteam == null ? null : tgteam.trim();
    }

    public Date getMdate() {
        return mdate;
    }

    public void setMdate(Date mdate) {
        this.mdate = mdate;
    }

    public String getDatetimes() {
        return datetimes;
    }

    public void setDatetimes(String datetimes) {
        this.datetimes = datetimes == null ? null : datetimes.trim();
    }

    public String getScorefirsthalf() {
        return scorefirsthalf;
    }

    public void setScorefirsthalf(String scorefirsthalf) {
        this.scorefirsthalf = scorefirsthalf == null ? null : scorefirsthalf.trim();
    }

    public String getScorefullcourt() {
        return scorefullcourt;
    }

    public void setScorefullcourt(String scorefullcourt) {
        this.scorefullcourt = scorefullcourt == null ? null : scorefullcourt.trim();
    }

    public Object getAll() {
        return all;
    }

    public void setAll(Object all) {
        this.all = all;
    }

    public String getScore1() {
        return score1;
    }

    public void setScore1(String score1) {
        this.score1 = score1 == null ? null : score1.trim();
    }

    public String getScore2() {
        return score2;
    }

    public void setScore2(String score2) {
        this.score2 = score2 == null ? null : score2.trim();
    }

    public String getScore3() {
        return score3;
    }

    public void setScore3(String score3) {
        this.score3 = score3 == null ? null : score3.trim();
    }

    public String getScore4() {
        return score4;
    }

    public void setScore4(String score4) {
        this.score4 = score4 == null ? null : score4.trim();
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}