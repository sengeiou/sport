package com.cn.great.model.game;

import lombok.Data;

import java.io.Serializable;

/**
* @Description: 足球投注限额表
* @Author: Stamp
* @Date: 2019/5/16
*/
@Data
public class MemberFtConfig implements Serializable {
    private static final long serialVersionUID = 4609847802025129307L;

    private Integer userid;
    // 0-会员 1-代理
    private Integer type;
    // 1-平台 2-默认
    private String serverAdmin;

    private Integer ftReFthtMin;

    private Integer ftReFthtMax;

    private Integer ftReFthtlstMin;

    private Integer ftReFthtlstMax;

    private Integer ftReAhMin;

    private Integer ftReAhMax;

    private Integer ftReAhlstMin;

    private Integer ftReAhlstMax;

    private Integer ftReOuMin;

    private Integer ftReOuMax;

    private Integer ftReOulstMin;

    private Integer ftReOulstMax;

    private Integer ftRbFthtMin;

    private Integer ftRbFthtMax;

    private Integer ftRbFthtlstMin;

    private Integer ftRbFthtlstMax;

    private Integer ftRbAhMin;

    private Integer ftRbAhMax;

    private Integer ftRbAhlstMin;

    private Integer ftRbAhlstMax;

    private Integer ftRbOuMin;

    private Integer ftRbOuMax;

    private Integer ftRbOulstMin;

    private Integer ftRbOulstMax;

    private Integer ftRbOeMin;

    private Integer ftRbOeMax;

    private Integer ftRbOelstMin;

    private Integer ftRbOelstMax;

    private Integer ftRbCsMin;

    private Integer ftRbCsMax;

    private Integer ftRbTgMin;

    private Integer ftRbTgMax;

    private Integer ftRbTglstMin;

    private Integer ftRbTglstMax;

    private Integer ftRbHfMin;

    private Integer ftRbHfMax;

    private Integer ftRbFglgMin;

    private Integer ftRbFglgMax;

    private Integer ftRFthtMin;

    private Integer ftRFthtMax;

    private Integer ftRFthtlstMin;

    private Integer ftRFthtlstMax;

    private Integer ftRAhMin;

    private Integer ftRAhMax;

    private Integer ftRAhlstMin;

    private Integer ftRAhlstMax;

    private Integer ftROuMin;

    private Integer ftROuMax;

    private Integer ftROulstMin;

    private Integer ftROulstMax;

    private Integer ftROeMin;

    private Integer ftROeMax;

    private Integer ftROelstMin;

    private Integer ftROelstMax;

    private Integer ftRCsMin;

    private Integer ftRCsMax;

    private Integer ftRTgMin;

    private Integer ftRTgMax;

    private Integer ftRTglstMin;

    private Integer ftRTglstMax;

    private Integer ftRHfMin;

    private Integer ftRHfMax;

    private Integer ftRFglgMin;

    private Integer ftRFglgMax;

    private Integer ftOrMin;

    private Integer ftOrMax;

    private Integer ftP3Min;

    private Integer ftP3Max;

}