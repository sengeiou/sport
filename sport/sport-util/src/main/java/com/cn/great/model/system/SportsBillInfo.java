package com.cn.great.model.system;

public class SportsBillInfo {
    private Long id;

    private String middle;

    private String betType;

    private Integer agentsId;

    private Integer betip;

    private Boolean isphone;

    private Boolean checkFrom;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMiddle() {
        return middle;
    }

    public void setMiddle(String middle) {
        this.middle = middle == null ? null : middle.trim();
    }

    public String getBetType() {
        return betType;
    }

    public void setBetType(String betType) {
        this.betType = betType == null ? null : betType.trim();
    }

    public Integer getAgentsId() {
        return agentsId;
    }

    public void setAgentsId(Integer agentsId) {
        this.agentsId = agentsId;
    }

    public Integer getBetip() {
        return betip;
    }

    public void setBetip(Integer betip) {
        this.betip = betip;
    }

    public Boolean getIsphone() {
        return isphone;
    }

    public void setIsphone(Boolean isphone) {
        this.isphone = isphone;
    }

    public Boolean getCheckFrom() {
        return checkFrom;
    }

    public void setCheckFrom(Boolean checkFrom) {
        this.checkFrom = checkFrom;
    }
}