package com.cn.great.model.system;

import java.util.Date;

public class DiscountData {
    private Integer id;

    private String name;

    private String intro;

    private Date startTime;

    private Date endTime;

    private Boolean pc;

    private Boolean wap;

    private Boolean status;

    private Integer level;

    private String pcBigImg;

    private String pcSmallImg;

    private String wapBigImg;

    private String wapSmallImg;

    private String serverAdmin;

    private String description;

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

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
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

    public Boolean getPc() {
        return pc;
    }

    public void setPc(Boolean pc) {
        this.pc = pc;
    }

    public Boolean getWap() {
        return wap;
    }

    public void setWap(Boolean wap) {
        this.wap = wap;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getPcBigImg() {
        return pcBigImg;
    }

    public void setPcBigImg(String pcBigImg) {
        this.pcBigImg = pcBigImg == null ? null : pcBigImg.trim();
    }

    public String getPcSmallImg() {
        return pcSmallImg;
    }

    public void setPcSmallImg(String pcSmallImg) {
        this.pcSmallImg = pcSmallImg == null ? null : pcSmallImg.trim();
    }

    public String getWapBigImg() {
        return wapBigImg;
    }

    public void setWapBigImg(String wapBigImg) {
        this.wapBigImg = wapBigImg == null ? null : wapBigImg.trim();
    }

    public String getWapSmallImg() {
        return wapSmallImg;
    }

    public void setWapSmallImg(String wapSmallImg) {
        this.wapSmallImg = wapSmallImg == null ? null : wapSmallImg.trim();
    }

    public String getServerAdmin() {
        return serverAdmin;
    }

    public void setServerAdmin(String serverAdmin) {
        this.serverAdmin = serverAdmin == null ? null : serverAdmin.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}