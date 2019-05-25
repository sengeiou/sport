package com.cn.great.model.system;

import java.math.BigDecimal;
import java.util.Date;

public class LotteryBillHistory {
    private Integer id;

    private Integer userid;

    private Integer gameCode;

    private Integer typeCode;

    private Integer happy8;

    private String round;

    private BigDecimal dropMoney;

    private String dropContent;

    private BigDecimal total;

    private BigDecimal validMoney;

    private BigDecimal userWin;

    private BigDecimal userCut;

    private BigDecimal userRate;

    private String xqRate;

    private Integer countPay;

    private Long betIp;

    private Date betTime;

    private Integer xqDeId;

    private Boolean countStatus;

    private String orderNumber;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getGameCode() {
        return gameCode;
    }

    public void setGameCode(Integer gameCode) {
        this.gameCode = gameCode;
    }

    public Integer getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(Integer typeCode) {
        this.typeCode = typeCode;
    }

    public Integer getHappy8() {
        return happy8;
    }

    public void setHappy8(Integer happy8) {
        this.happy8 = happy8;
    }

    public String getRound() {
        return round;
    }

    public void setRound(String round) {
        this.round = round == null ? null : round.trim();
    }

    public BigDecimal getDropMoney() {
        return dropMoney;
    }

    public void setDropMoney(BigDecimal dropMoney) {
        this.dropMoney = dropMoney;
    }

    public String getDropContent() {
        return dropContent;
    }

    public void setDropContent(String dropContent) {
        this.dropContent = dropContent == null ? null : dropContent.trim();
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public BigDecimal getValidMoney() {
        return validMoney;
    }

    public void setValidMoney(BigDecimal validMoney) {
        this.validMoney = validMoney;
    }

    public BigDecimal getUserWin() {
        return userWin;
    }

    public void setUserWin(BigDecimal userWin) {
        this.userWin = userWin;
    }

    public BigDecimal getUserCut() {
        return userCut;
    }

    public void setUserCut(BigDecimal userCut) {
        this.userCut = userCut;
    }

    public BigDecimal getUserRate() {
        return userRate;
    }

    public void setUserRate(BigDecimal userRate) {
        this.userRate = userRate;
    }

    public String getXqRate() {
        return xqRate;
    }

    public void setXqRate(String xqRate) {
        this.xqRate = xqRate == null ? null : xqRate.trim();
    }

    public Integer getCountPay() {
        return countPay;
    }

    public void setCountPay(Integer countPay) {
        this.countPay = countPay;
    }

    public Long getBetIp() {
        return betIp;
    }

    public void setBetIp(Long betIp) {
        this.betIp = betIp;
    }

    public Date getBetTime() {
        return betTime;
    }

    public void setBetTime(Date betTime) {
        this.betTime = betTime;
    }

    public Integer getXqDeId() {
        return xqDeId;
    }

    public void setXqDeId(Integer xqDeId) {
        this.xqDeId = xqDeId;
    }

    public Boolean getCountStatus() {
        return countStatus;
    }

    public void setCountStatus(Boolean countStatus) {
        this.countStatus = countStatus;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber == null ? null : orderNumber.trim();
    }
}