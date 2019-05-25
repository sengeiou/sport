package com.cn.great.req.game;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: sportmanage
 * @description: 会员篮球限额请求Req
 * @author: Stamp
 * @create: 2019-05-16 16:21
 **/
@Data
public class MemberBKConfigReq extends BaseEntity {

    private Integer userid;
    // 0-会员 1-代理
    private Integer type;
    // 1-平台 2-默认
    private String serverAdmin;

    private Integer bkReFthtMin;

    private Integer bkReFthtMax;

    private Integer bkReAhMin;

    private Integer bkReAhMax;

    private Integer bkReOuMin;

    private Integer bkReOuMax;

    private Integer bkReBigMin;

    private Integer bkReBigMax;

    private Integer bkReSmallMin;

    private Integer bkReSmallMax;

    private Integer bkRbFthtMin;

    private Integer bkRbFthtMax;

    private Integer bkRbAhMin;

    private Integer bkRbAhMax;

    private Integer bkRbOuMin;

    private Integer bkRbOuMax;

    private Integer bkRbBigMin;

    private Integer bkRbBigMax;

    private Integer bkRbSmallMin;

    private Integer bkRbSmallMax;

    private Integer bkRFthtMin;

    private Integer bkRFthtMax;

    private Integer bkRAhMin;

    private Integer bkRAhMax;

    private Integer bkROuMin;

    private Integer bkROuMax;

    private Integer bkRBigMin;

    private Integer bkRBigMax;

    private Integer bkRSmallMin;

    private Integer bkRSmallMax;

    private Integer bkOrMin;

    private Integer bkOrMax;

    private Integer bkP3Min;

    private Integer bkP3Max;


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
