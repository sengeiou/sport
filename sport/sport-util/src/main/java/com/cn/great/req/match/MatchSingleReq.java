package com.cn.great.req.match;

import lombok.Data;

@Data
public class MatchSingleReq {

    private Integer eid;

    private Integer v;

    //{"eid":"3117996","ifl":false,"iip":false,"isp":false,"ot":2,"ubt":"am","tz":480,"v":0}

    private Boolean ifl;

    private Boolean isp;

    private Boolean iip;

    private Integer tz;

    //or -- 冠军  am---大小球  ftht1x2 -- 独赢盘 (半场 & 全场)
    //oe -- 入球数-单/双  tg---总入球  htft--半场/全场  cs ---波胆
    //fglg---最先 / 最后进球
    private String ubt;

    private Integer ot;

    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append("{\"eid\":").append(getEid()).append(",")
                .append("\"ifl\":").append(getIfl()).append(",")
                .append("\"iip\":").append(getIip()).append(",")
                .append("\"isp\":").append(getIsp()).append(",")
                .append("\"ot\":").append(getOt()).append(",")
                .append("\"ubt\":\"").append(getUbt()).append("\",")
                .append("\"tz\":").append(getTz()).append(",")
                .append("\"v\"");
        if (getV() != 0)
            sb.append("[").append(getV()).append("]");
        else
            sb.append(getV());
        return sb.toString();
    }
}
