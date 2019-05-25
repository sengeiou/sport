package com.cn.great.model.system;

import java.util.Date;

public class MemberInfo {
    private Integer userid;

    private Date addDate;

    private String birthday;

    private String withdrawalPasswd;

    private String notes;

    private Boolean agopen;

    private Boolean cpopen;

    private Boolean mgopen;

    private String alias;

    private Boolean testFlag;

    private String regIp;

    private Integer bankId;

    private Integer vipLevel;

    private Boolean question;

    private String answer;

    private Object collection;

    private Date messageTime;

    private Long hisLoss;

    private Long hisBets;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }

    public String getWithdrawalPasswd() {
        return withdrawalPasswd;
    }

    public void setWithdrawalPasswd(String withdrawalPasswd) {
        this.withdrawalPasswd = withdrawalPasswd == null ? null : withdrawalPasswd.trim();
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes == null ? null : notes.trim();
    }

    public Boolean getAgopen() {
        return agopen;
    }

    public void setAgopen(Boolean agopen) {
        this.agopen = agopen;
    }

    public Boolean getCpopen() {
        return cpopen;
    }

    public void setCpopen(Boolean cpopen) {
        this.cpopen = cpopen;
    }

    public Boolean getMgopen() {
        return mgopen;
    }

    public void setMgopen(Boolean mgopen) {
        this.mgopen = mgopen;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias == null ? null : alias.trim();
    }

    public Boolean getTestFlag() {
        return testFlag;
    }

    public void setTestFlag(Boolean testFlag) {
        this.testFlag = testFlag;
    }

    public String getRegIp() {
        return regIp;
    }

    public void setRegIp(String regIp) {
        this.regIp = regIp == null ? null : regIp.trim();
    }

    public Integer getBankId() {
        return bankId;
    }

    public void setBankId(Integer bankId) {
        this.bankId = bankId;
    }

    public Integer getVipLevel() {
        return vipLevel;
    }

    public void setVipLevel(Integer vipLevel) {
        this.vipLevel = vipLevel;
    }

    public Boolean getQuestion() {
        return question;
    }

    public void setQuestion(Boolean question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public Object getCollection() {
        return collection;
    }

    public void setCollection(Object collection) {
        this.collection = collection;
    }

    public Date getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(Date messageTime) {
        this.messageTime = messageTime;
    }

    public Long getHisLoss() {
        return hisLoss;
    }

    public void setHisLoss(Long hisLoss) {
        this.hisLoss = hisLoss;
    }

    public Long getHisBets() {
        return hisBets;
    }

    public void setHisBets(Long hisBets) {
        this.hisBets = hisBets;
    }
}