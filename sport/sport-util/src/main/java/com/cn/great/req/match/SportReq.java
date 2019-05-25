package com.cn.great.req.match;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 体育注单下注记录 request
 */
@Data
public class SportReq {
    private int valType=0;
    /**
     * 搜索单个赛事
     */
    private String inputVal;
    private String mid;

    private String mleagueid;
    /**
     * 球赛类型
     */
    private String sportType;

    /**
     * 终端类型默认0是pc 1是wap 后续如果各端有特殊需求这各字段会再进行扩展
     */
    private String type;

    /**
     * 赛事种类 ft足球 bk篮球 等 后续再补充
     */
    private String terminal;

    /**
     * r早盘,rb 今日,re滚球 p3串场
     */
    private String mtype;

    /**
     * 玩法类型
     */
    private String rtype;
    /**
     * 赛事日期,早盘查询某一天需要
     */
    private String mdate;
    /**
     * 0是默认排序 ，1是以开赛时间排序
     */
    private int order;
    /**
     * 分页 默认1
     */
    private Integer page=1;

    /**
     * 分页数量 默认100条
     */
    private Integer limit=100;

    private Boolean tv;
}
