package com.cn.great.req.match;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 体育注单下注记录 request
 */
@Data
public class SportBetLogReq {

    /**
     * 球赛类型
     */
    private String sportType;

    /**
     * 玩法 独赢 大小 单双 等
     */
    private String type;

    /**
     * 球赛日期  0000-00-00
     */
    private String sportDate;

    /**
     * 下注时间_start 0000-00-00 00：00：00
     */
    private String betTime_start;

    /**
     * 下注时间_end 0000-00-00 00：00：00
     */
    private String betTime_end;

    /**
     * 0 全部 1结算 2未结算 3取消
     */
    private int billStatus;

    /**
     * 0 使用分页 1查询全部
     */
    @NotNull
    private Integer pagelimit;

    /**
     * 分页 默认0
     */
    @NotNull
    private Integer page;

    /**
     * 分页数量 默认10条
     */
    @NotNull
    private Integer limit;
}
