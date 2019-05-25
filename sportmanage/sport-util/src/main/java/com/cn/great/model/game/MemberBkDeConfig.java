package com.cn.great.model.game;

import lombok.Data;

import java.io.Serializable;

/**
* @Description: 篮球投注限额表--默认
* @Author: Stamp
* @Date: 2019/5/16
*/
@Data
public class MemberBkDeConfig implements Serializable {

    private static final long serialVersionUID = -7402161755056945451L;

    private Integer userid;
    // 0-会员 1-代理
    private Integer type;
    // 1-平台 2-默认
    private String serverAdmin;

    private Integer bkReFthtMinDe;

    private Integer bkReFthtMaxDe;

    private Integer bkReAhMinDe;

    private Integer bkReAhMaxDe;

    private Integer bkReOuMinDe;

    private Integer bkReOuMaxDe;

    private Integer bkReBigMinDe;

    private Integer bkReBigMaxDe;

    private Integer bkReSmallMinDe;

    private Integer bkReSmallMaxDe;

    private Integer bkRbFthtMinDe;

    private Integer bkRbFthtMaxDe;

    private Integer bkRbAhMinDe;

    private Integer bkRbAhMaxDe;

    private Integer bkRbOuMinDe;

    private Integer bkRbOuMaxDe;

    private Integer bkRbBigMinDe;

    private Integer bkRbBigMaxDe;

    private Integer bkRbSmallMinDe;

    private Integer bkRbSmallMaxDe;

    private Integer bkRFthtMinDe;

    private Integer bkRFthtMaxDe;

    private Integer bkRAhMinDe;

    private Integer bkRAhMaxDe;

    private Integer bkROuMinDe;

    private Integer bkROuMaxDe;

    private Integer bkRBigMinDe;

    private Integer bkRBigMaxDe;

    private Integer bkRSmallMinDe;

    private Integer bkRSmallMaxDe;

    private Integer bkOrMinDe;

    private Integer bkOrMaxDe;

    private Integer bkP3MinDe;

    private Integer bkP3MaxDe;

}