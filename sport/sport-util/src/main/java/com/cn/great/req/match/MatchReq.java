package com.cn.great.req.match;

import lombok.Data;

@Data
public class MatchReq {

    private Integer pid;

    //{"ifl":true,"ipf":false,"iip":false,"pn":0,"tz":480,
    // "pt":1,"pid":0,"sid":[2],"ubt":"or","dc":null,"dv":-1,"ot":0}

    private Boolean ifl;

    private Boolean ipf;

    private Boolean iip;

    private Integer pn;

    private Integer tz;

    private Integer pt;

    private String sid;

    //or -- 冠军  am---大小球  ftht1x2 -- 独赢盘 (半场 & 全场)
    //oe -- 入球数-单/双  tg---总入球  htft--半场/全场  cs ---波胆
    //fglg---最先 / 最后进球
    private String ubt;

    private String dc;

    private Integer dv;

    private Integer ot;

    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append("{\"ifl\":").append(getIfl()).append(",")
                .append("\"ipf\":").append(getIpf()).append(",")
                .append("\"iip\":").append(getIip()).append(",")
                .append("\"pn\":").append(getPn()).append(",")
                .append("\"tz\":").append(getTz()).append(",")
                .append("\"pt\":").append(getPt()).append(",")
                .append("\"pid\":").append(getPid()).append(",")
                .append("\"sid\":[").append(getSid()).append("]").append(",")
                .append("\"ubt\":\"").append(getUbt()).append("\",")
                .append("\"dc\":").append(getDc()).append(",")
                .append("\"dv\":").append(getDv()).append(",")
                .append("\"ot\":").append(getOt()).append("}");
        return sb.toString();
    }
}
