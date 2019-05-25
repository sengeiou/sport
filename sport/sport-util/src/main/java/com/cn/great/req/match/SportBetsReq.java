package com.cn.great.req.match;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 体育下注 request
 */
@Data
public class SportBetsReq {

    /**
     * 赛事id
     */
    @NotNull
    private Integer mid;
    /**
     * 联赛id
     */
    @NotNull
    private Integer mleagueid;
    /**
     * 盘口类型 ft bk
     */
    @NotNull
    private String sportType;

    /**
     * 盘口类型 rb re r or
     */
    @NotNull
    private String mtype;
    /**
     * 具体玩法 如：大小 单双
     */
    @NotNull
    private String type;


    private String fglgtype="0";

    /**
     * 赔率id
     */
    @NotNull
    private String oddsid;

    /**
     * 赔率
     */
    @NotNull
    private String oddsv;

    /**
     * 让球/大小球 id
     */
    @NotNull
    private String oddsNid;

    /**
     * 让球数/大小球数
     */
    @NotNull
    private String oddsNv;

    /**
     * 下注类型 让球，大小，独赢 等
     */
    @NotNull
    private String betFormTitle;

    /**
     * 下注盘口详情
     */
    @NotNull
    private String betFormDetail;

    /**
     * H主队，C客队 E和局 |H是大  C是小| H是单  C是双| 波胆比分 1-0|
     */
    @NotNull
    private String betFormType;
    /**
     * 下注金额
     */
    @NotNull
    private String betFormAmount;
    /**
     * 是否选择最佳赔率 默认选择0 选择当前赔率1
     */
    @NotNull
    private String betFormIsCheck;
}
