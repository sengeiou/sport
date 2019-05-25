package com.cn.great.model.system;

import java.util.Date;

public class ScoreChangeFt {
    private Integer id;

    private Integer mid;

    private String mbTeam;

    private String tgTeam;

    private Byte mbScore;

    private Byte tgScore;

    private Date mTime;

    private Date mStart;

    private String nowPlay;

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

    public String getMbTeam() {
        return mbTeam;
    }

    public void setMbTeam(String mbTeam) {
        this.mbTeam = mbTeam == null ? null : mbTeam.trim();
    }

    public String getTgTeam() {
        return tgTeam;
    }

    public void setTgTeam(String tgTeam) {
        this.tgTeam = tgTeam == null ? null : tgTeam.trim();
    }

    public Byte getMbScore() {
        return mbScore;
    }

    public void setMbScore(Byte mbScore) {
        this.mbScore = mbScore;
    }

    public Byte getTgScore() {
        return tgScore;
    }

    public void setTgScore(Byte tgScore) {
        this.tgScore = tgScore;
    }

    public Date getmTime() {
        return mTime;
    }

    public void setmTime(Date mTime) {
        this.mTime = mTime;
    }

    public Date getmStart() {
        return mStart;
    }

    public void setmStart(Date mStart) {
        this.mStart = mStart;
    }

    public String getNowPlay() {
        return nowPlay;
    }

    public void setNowPlay(String nowPlay) {
        this.nowPlay = nowPlay == null ? null : nowPlay.trim();
    }
}