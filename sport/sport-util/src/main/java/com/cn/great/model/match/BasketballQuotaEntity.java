package com.cn.great.model.match;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

/**
 * 篮球下注限额
 */
@Data
@Builder
public class BasketballQuotaEntity implements Serializable {

    private static final long serialVersionUID = 4564892220115903047L;
    private Integer userid;
    /**
     * 代理
     */
    private String server_admin;

    /**
     * 0-会员1-代理
     */
    private Integer type;

    /**
     * 滚球全场独赢最小
     */
    private Integer bk_re_ftht_min;

    /**
     * 滚球全场独赢最大
     */
    private Integer bk_re_ftht_max;

    /**
     * 滚球全场让球最小
     */
    private Integer bk_re_ah_min;

    /**
     * 滚球全场让球最大
     */
    private Integer bk_re_ah_max;

    /**
     * 滚球全场大小单场
     */
    private Integer bk_re_ou_min;

    /**
     * 滚球全场大小单场
     */
    private Integer bk_re_ou_max;

    /**
     * 滚球球队得分小
     */
    private Integer bk_re_big_min;
    /**
     * 滚球球队得分大
     */
    private Integer bk_re_big_max;
    //滚球球队得分小
    private Integer bk_re_small_min;
    //滚球球队得分大
    private Integer bk_re_small_max;
    //今日全场独赢最小
    private Integer bk_rb_ftht_min;
    //今日全场独赢最大
    private Integer bk_rb_ftht_max;
    //今日全场让球最小
    private Integer bk_rb_ah_min;
    //今日全场让球最大
    private Integer bk_rb_ah_max;
    //今日全场大小单场
    private Integer bk_rb_ou_min;
    //今日全场大小单场
    private Integer bk_rb_ou_max;
    //今日球队得分小
    private Integer bk_rb_big_min;
    //今日球队得分大
    private Integer bk_rb_big_max;
    //今日球队得分小
    private Integer bk_rb_small_min;
    //今日球队得分大
    private Integer bk_rb_small_max;
    //早盘全场独赢最小
    private Integer bk_r_ftht_min;
    //早盘全场独赢最大
    private Integer bk_r_ftht_max;
    //早盘全场让球最小
    private Integer bk_r_ah_min;
    //早盘全场让球最大
    private Integer bk_r_ah_max;
    //早盘全场大小单场
    private Integer bk_r_ou_min;
    //早盘全场大小单场
    private Integer bk_r_ou_max;
    //早盘球队得分小
    private Integer bk_r_big_min;
    //早盘球队得分大
    private Integer bk_r_big_max;
    //早盘球队得分小
    private Integer bk_r_small_min;
    //早盘球队得分大
    private Integer bk_r_small_max;
    //冠军小
    private Integer bk_or_min;
    //冠军大
    private Integer bk_or_max;
    //串场小
    private Integer bk_p3_min;
    //串场大
    private Integer bk_p3_max;

}
