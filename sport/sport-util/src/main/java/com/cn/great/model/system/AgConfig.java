package com.cn.great.model.system;

public class AgConfig {
    private String agip;

    private String subfix;

    private String website;

    private String server;

    private String newgc;

    private String apiserver;

    private String cagent;

    private String desckey;

    private String md5key;

    private String domain;

    private String agftp;

    private String agftpPort;

    private String agftpUser;

    private String agftpPsw;

    private String serverAdmin;

    public String getAgip() {
        return agip;
    }

    public void setAgip(String agip) {
        this.agip = agip == null ? null : agip.trim();
    }

    public String getSubfix() {
        return subfix;
    }

    public void setSubfix(String subfix) {
        this.subfix = subfix == null ? null : subfix.trim();
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website == null ? null : website.trim();
    }

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server == null ? null : server.trim();
    }

    public String getNewgc() {
        return newgc;
    }

    public void setNewgc(String newgc) {
        this.newgc = newgc == null ? null : newgc.trim();
    }

    public String getApiserver() {
        return apiserver;
    }

    public void setApiserver(String apiserver) {
        this.apiserver = apiserver == null ? null : apiserver.trim();
    }

    public String getCagent() {
        return cagent;
    }

    public void setCagent(String cagent) {
        this.cagent = cagent == null ? null : cagent.trim();
    }

    public String getDesckey() {
        return desckey;
    }

    public void setDesckey(String desckey) {
        this.desckey = desckey == null ? null : desckey.trim();
    }

    public String getMd5key() {
        return md5key;
    }

    public void setMd5key(String md5key) {
        this.md5key = md5key == null ? null : md5key.trim();
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain == null ? null : domain.trim();
    }

    public String getAgftp() {
        return agftp;
    }

    public void setAgftp(String agftp) {
        this.agftp = agftp == null ? null : agftp.trim();
    }

    public String getAgftpPort() {
        return agftpPort;
    }

    public void setAgftpPort(String agftpPort) {
        this.agftpPort = agftpPort == null ? null : agftpPort.trim();
    }

    public String getAgftpUser() {
        return agftpUser;
    }

    public void setAgftpUser(String agftpUser) {
        this.agftpUser = agftpUser == null ? null : agftpUser.trim();
    }

    public String getAgftpPsw() {
        return agftpPsw;
    }

    public void setAgftpPsw(String agftpPsw) {
        this.agftpPsw = agftpPsw == null ? null : agftpPsw.trim();
    }

    public String getServerAdmin() {
        return serverAdmin;
    }

    public void setServerAdmin(String serverAdmin) {
        this.serverAdmin = serverAdmin == null ? null : serverAdmin.trim();
    }
}