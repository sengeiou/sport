package com.cn.great.model.system;

public class MgConfig {
    private String subfix;

    private String memUrl;

    private Integer partnerId;

    private String apiUsr;

    private String apiPsw;

    private String currencyCode;

    private String language;

    private String agUsr;

    private String agPsw;

    private String agUrl;

    private Long agNeid;

    private Integer agLstLogin;

    private Integer agLstId;

    private String serverAdmin;

    private String accessToken;

    private String refreshToken;

    public String getSubfix() {
        return subfix;
    }

    public void setSubfix(String subfix) {
        this.subfix = subfix == null ? null : subfix.trim();
    }

    public String getMemUrl() {
        return memUrl;
    }

    public void setMemUrl(String memUrl) {
        this.memUrl = memUrl == null ? null : memUrl.trim();
    }

    public Integer getPartnerId() {
        return partnerId;
    }

    public void setPartnerId(Integer partnerId) {
        this.partnerId = partnerId;
    }

    public String getApiUsr() {
        return apiUsr;
    }

    public void setApiUsr(String apiUsr) {
        this.apiUsr = apiUsr == null ? null : apiUsr.trim();
    }

    public String getApiPsw() {
        return apiPsw;
    }

    public void setApiPsw(String apiPsw) {
        this.apiPsw = apiPsw == null ? null : apiPsw.trim();
    }

    public String getCurrencyCode() {
        return currencyCode;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode == null ? null : currencyCode.trim();
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language == null ? null : language.trim();
    }

    public String getAgUsr() {
        return agUsr;
    }

    public void setAgUsr(String agUsr) {
        this.agUsr = agUsr == null ? null : agUsr.trim();
    }

    public String getAgPsw() {
        return agPsw;
    }

    public void setAgPsw(String agPsw) {
        this.agPsw = agPsw == null ? null : agPsw.trim();
    }

    public String getAgUrl() {
        return agUrl;
    }

    public void setAgUrl(String agUrl) {
        this.agUrl = agUrl == null ? null : agUrl.trim();
    }

    public Long getAgNeid() {
        return agNeid;
    }

    public void setAgNeid(Long agNeid) {
        this.agNeid = agNeid;
    }

    public Integer getAgLstLogin() {
        return agLstLogin;
    }

    public void setAgLstLogin(Integer agLstLogin) {
        this.agLstLogin = agLstLogin;
    }

    public Integer getAgLstId() {
        return agLstId;
    }

    public void setAgLstId(Integer agLstId) {
        this.agLstId = agLstId;
    }

    public String getServerAdmin() {
        return serverAdmin;
    }

    public void setServerAdmin(String serverAdmin) {
        this.serverAdmin = serverAdmin == null ? null : serverAdmin.trim();
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken == null ? null : accessToken.trim();
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken == null ? null : refreshToken.trim();
    }
}