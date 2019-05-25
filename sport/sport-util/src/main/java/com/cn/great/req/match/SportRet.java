package com.cn.great.req.match;

import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 体育注单下注记录 request
 */
@Data
@Document(collection = "mongdb_sport")
public class SportRet {

    /**
     * 联赛id
     */
    private String mleagueid;

    /**
     * 联赛名称
     */
    private String mleague;
    /**
     * 日期
     */
    private String date;

    /**
     * 下注时间_end 0000-00-00 00：00：00
     */
    private String nums;

    private String tv_url;
}
