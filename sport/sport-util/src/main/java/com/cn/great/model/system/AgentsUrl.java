package com.cn.great.model.system;

public class AgentsUrl {
    private Integer id;

    private Integer agentsId;

    private String agentsUrl;

    private String notes;

    private String serverAdmin;

    private Boolean status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAgentsId() {
        return agentsId;
    }

    public void setAgentsId(Integer agentsId) {
        this.agentsId = agentsId;
    }

    public String getAgentsUrl() {
        return agentsUrl;
    }

    public void setAgentsUrl(String agentsUrl) {
        this.agentsUrl = agentsUrl == null ? null : agentsUrl.trim();
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes == null ? null : notes.trim();
    }

    public String getServerAdmin() {
        return serverAdmin;
    }

    public void setServerAdmin(String serverAdmin) {
        this.serverAdmin = serverAdmin == null ? null : serverAdmin.trim();
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}