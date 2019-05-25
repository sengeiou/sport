package com.cn.great.model.system;

import java.math.BigDecimal;

public class MgBill {
    private String key;

    private Long colid;

    private String type;

    private Long transactiontimestampdate;

    private BigDecimal amount;

    private String mbrcode;

    private String gamecasinoid;

    private BigDecimal aftertxwalletamount;

    private Integer mgsgameid;

    private String gameplatformtype;

    private Integer userid;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key == null ? null : key.trim();
    }

    public Long getColid() {
        return colid;
    }

    public void setColid(Long colid) {
        this.colid = colid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Long getTransactiontimestampdate() {
        return transactiontimestampdate;
    }

    public void setTransactiontimestampdate(Long transactiontimestampdate) {
        this.transactiontimestampdate = transactiontimestampdate;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getMbrcode() {
        return mbrcode;
    }

    public void setMbrcode(String mbrcode) {
        this.mbrcode = mbrcode == null ? null : mbrcode.trim();
    }

    public String getGamecasinoid() {
        return gamecasinoid;
    }

    public void setGamecasinoid(String gamecasinoid) {
        this.gamecasinoid = gamecasinoid == null ? null : gamecasinoid.trim();
    }

    public BigDecimal getAftertxwalletamount() {
        return aftertxwalletamount;
    }

    public void setAftertxwalletamount(BigDecimal aftertxwalletamount) {
        this.aftertxwalletamount = aftertxwalletamount;
    }

    public Integer getMgsgameid() {
        return mgsgameid;
    }

    public void setMgsgameid(Integer mgsgameid) {
        this.mgsgameid = mgsgameid;
    }

    public String getGameplatformtype() {
        return gameplatformtype;
    }

    public void setGameplatformtype(String gameplatformtype) {
        this.gameplatformtype = gameplatformtype == null ? null : gameplatformtype.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}