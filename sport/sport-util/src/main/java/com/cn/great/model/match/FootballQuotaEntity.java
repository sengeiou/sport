package com.cn.great.model.match;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

/**
 * 足球下注限额
 */
@Data
@Builder
public class FootballQuotaEntity implements Serializable {

    private static final long serialVersionUID = -4600453525016477837L;
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
     * 足球滚球全场独赢最小
     */
    private Integer ft_re_ftht_min;

    /**
     * 足球滚球全场独赢最大
     */
    private Integer ft_re_ftht_max;

    /**
     * 足球滚球半场独赢最最小
     */
    private Integer ft_re_fthtlst_min;

    /**
     * 足球滚球半场独赢最大
     */
    private Integer ft_re_fthtlst_max;

    /**
     * 足球滚球全场让球最小
     */
    private Integer ft_re_ah_min;

    /**
     * 足球滚球全场让球最大
     */
    private Integer ft_re_ah_max;

    /**
     * 足球滚球半场让球独赢最小
     */
    private Integer ft_re_ahlst_min;
    /**
     * 足球滚球半场让球独赢最大
     */
    private Integer ft_re_ahlst_max;
    //足球滚球全场大小单场
    private Integer ft_re_oulst_min;
    //足球滚球全场大小单场
    private Integer ft_re_oulst_max;
    //足球今日全场独赢最小
    private Integer ft_rb_ftht_min;
    //足球今日全场独赢最大
    private Integer ft_rb_ftht_max;
    //今足球今日半场独赢最小
    private Integer ft_rb_fthtlst_min;
    //足球今日半场独赢最大
    private Integer ft_rb_fthtlst_max;
    //足球今日全场让球最小
    private Integer ft_rb_ah_min;
    //足球今日全场让球最大
    private Integer ft_rb_ah_max;
    //足球今日半场让球独赢最小
    private Integer ft_rb_ahlst_min;
    //足球今日半场让球独赢最大
    private Integer ft_rb_ahlst_max;
    //足球今日全场大小小
    private Integer ft_rb_ou_min;
    //足球今日全场大小大
    private Integer ft_rb_ou_max;
    //足球今日半场大小小
    private Integer ft_rb_oulst_min;
    //足球今日半场大小大
    private Integer ft_rb_oulst_max;
    //足球今日全场单双小
    private Integer ft_rb_oe_min;
    //足球今日全场单双大
    private Integer ft_rb_oe_max;
    //足球今日半场单双小
    private Integer ft_rb_oelst_min;
    //足球今日半场单双大
    private Integer ft_rb_oelst_max;
    //足球今日波胆小
    private Integer ft_rb_cs_min;
    //足球今日波胆大
    private Integer ft_rb_cs_max;
    //足球今日全场总入球小
    private Integer ft_rb_tg_min;
    //足球今日全场总入球大
    private Integer ft_rb_tg_max;
    //足球今日半场总入球小
    private Integer ft_rb_tglst_min;
    //足球今日半场总入球大
    private Integer ft_rb_tglst_max;
    //足球今日半场全场小
    private Integer ft_rb_hf_min;
    //足球今日半场全场大
    private Integer ft_rb_hf_max;

    //足球今日最先最后进球小
    private Integer ft_rb_fglg_min;
    //足球今日最先最后进球大
    private Integer ft_rb_fglg_max;
    //足球滚球全场独赢最小
    private Integer ft_r_ftht_min;
    //足球滚球全场独赢最大
    private Integer ft_r_ftht_max;
    //足球滚球半场独赢最小
    private Integer ft_r_fthtlst_min;
    //足球滚球半场独赢最大
    private Integer ft_r_fthtlst_max;
    //足球早盘全场让球最小
    private Integer ft_r_ah_min;
    //足球早盘全场让球最大
    private Integer ft_r_ah_max;
    //足球早盘半场让球最小
    private Integer ft_r_ahlst_min;
    //足球早盘半场让球最大
    private Integer ft_r_ahlst_max;
    //足球早盘全场大小小
    private Integer ft_r_ou_min;
    //足球早盘全场大小大
    private Integer ft_r_ou_max;
    //足球早盘半场大小
    private Integer ft_r_oulst_min;
    //足球早盘半场大小大
    private Integer ft_r_oulst_max;
    //足球早盘全场单双小
    private Integer ft_r_oe_min;
    //足球早盘全场单双大
    private Integer ft_r_oe_max;
    //足球早盘半场单双小
    private Integer ft_r_oelst_min;
    //足球早盘半场单双大
    private Integer ft_r_oelst_max;
    //足球早盘波胆小
    private Integer ft_r_cs_min;
    //足球早盘波胆大
    private Integer ft_r_cs_max;
    //足球早盘全场总入球小
    private Integer ft_r_tg_min;
    //足球早盘全场总入球大
    private Integer ft_r_tg_max;
    //足球早盘半场总入球小
    private Integer ft_r_tglst_min;
    //足足球早盘半场总入球大
    private Integer ft_r_tglst_max;

    //足球早盘半场全场小
    private Integer ft_r_hf_min;
    //足球早盘半场全场大
    private Integer ft_r_hf_max;
    //足球早盘最先最后进球小
    private Integer ft_r_fglg_min;
    //足球早盘最先最后进球大
    private Integer ft_r_fglg_max;
    //足球冠军小
    private Integer ft_or_min;
    //足球冠军大
    private Integer ft_or_max;
    //足球串场小
    private Integer ft_p3_min;
    //足球串场大
    private Integer ft_p3_max;
}
