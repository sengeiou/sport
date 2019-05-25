package com.cn.great.model.system;

import java.math.BigDecimal;

public class MoneyLog {
    private Integer id;

    private Integer userid;

    private BigDecimal moneyf;

    private BigDecimal money;

    private BigDecimal moneys;

    private Byte type;

    private Integer orderId;

    private String addDate;

    private String notes;

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

    public BigDecimal getMoneyf() {
        return moneyf;
    }

    public void setMoneyf(BigDecimal moneyf) {
        this.moneyf = moneyf;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getMoneys() {
        return moneys;
    }

    public void setMoneys(BigDecimal moneys) {
        this.moneys = moneys;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getAddDate() {
        return addDate;
    }

    public void setAddDate(String addDate) {
        this.addDate = addDate == null ? null : addDate.trim();
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes == null ? null : notes.trim();
    }
}