package com.cn.great.model.game;

import lombok.Data;

import java.io.Serializable;

/**
* @Description: 足球投注限额表
* @Author: Stamp
* @Date: 2019/5/16
*/
@Data
public class MemberFtDeConfig implements Serializable {
    private static final long serialVersionUID = 4609847802025129307L;

    private Integer userid;
    // 0-会员 1-代理
    private Integer type;
    // 1-平台 2-默认
    private String serverAdmin;

    private Integer ftReFthtMinDe;

    private Integer ftReFthtMaxDe;

    private Integer ftReFthtlstMinDe;

    private Integer ftReFthtlstMaxDe;

    private Integer ftReAhMinDe;

    private Integer ftReAhMaxDe;

    private Integer ftReAhlstMinDe;

    private Integer ftReAhlstMaxDe;

    private Integer ftReOuMinDe;

    private Integer ftReOuMaxDe;

    private Integer ftReOulstMinDe;

    private Integer ftReOulstMaxDe;

    private Integer ftRbFthtMinDe;

    private Integer ftRbFthtMaxDe;

    private Integer ftRbFthtlstMinDe;

    private Integer ftRbFthtlstMaxDe;

    private Integer ftRbAhMinDe;

    private Integer ftRbAhMaxDe;

    private Integer ftRbAhlstMinDe;

    private Integer ftRbAhlstMaxDe;

    private Integer ftRbOuMinDe;

    private Integer ftRbOuMaxDe;

    private Integer ftRbOulstMinDe;

    private Integer ftRbOulstMaxDe;

    private Integer ftRbOeMinDe;

    private Integer ftRbOeMaxDe;

    private Integer ftRbOelstMinDe;

    private Integer ftRbOelstMaxDe;

    private Integer ftRbCsMinDe;

    private Integer ftRbCsMaxDe;

    private Integer ftRbTgMinDe;

    private Integer ftRbTgMaxDe;

    private Integer ftRbTglstMinDe;

    private Integer ftRbTglstMaxDe;

    private Integer ftRbHfMinDe;

    private Integer ftRbHfMaxDe;

    private Integer ftRbFglgMinDe;

    private Integer ftRbFglgMaxDe;

    private Integer ftRFthtMinDe;

    private Integer ftRFthtMaxDe;

    private Integer ftRFthtlstMinDe;

    private Integer ftRFthtlstMaxDe;

    private Integer ftRAhMinDe;

    private Integer ftRAhMaxDe;

    private Integer ftRAhlstMinDe;

    private Integer ftRAhlstMaxDe;

    private Integer ftROuMinDe;

    private Integer ftROuMaxDe;

    private Integer ftROulstMinDe;

    private Integer ftROulstMaxDe;

    private Integer ftROeMinDe;

    private Integer ftROeMaxDe;

    private Integer ftROelstMinDe;

    private Integer ftROelstMaxDe;

    private Integer ftRCsMinDe;

    private Integer ftRCsMaxDe;

    private Integer ftRTgMinDe;

    private Integer ftRTgMaxDe;

    private Integer ftRTglstMinDe;

    private Integer ftRTglstMaxDe;

    private Integer ftRHfMinDe;

    private Integer ftRHfMaxDe;

    private Integer ftRFglgMinDe;

    private Integer ftRFglgMaxDe;

    private Integer ftOrMinDe;

    private Integer ftOrMaxDe;

    private Integer ftP3MinDe;

    private Integer ftP3MaxDe;

}