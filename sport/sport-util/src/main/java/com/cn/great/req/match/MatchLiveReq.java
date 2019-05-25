package com.cn.great.req.match;

import lombok.Data;

@Data
public class MatchLiveReq {

    private Integer sid;

    private Integer eid;

    public String toString() {
        //?sid=1&eid=3116062&_=1554797725339
        StringBuffer sb = new StringBuffer();
        sb.append("sid=").append(getSid())
                .append("&eid=").append(getEid())
                .append("&_").append(System.currentTimeMillis());
        return sb.toString();
    }
}
