package com.cn.great.model.match;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 体育注单表 - web_sports_hot
 */
@Data
public class SportHotEntity implements Serializable {

    private static final long serialVersionUID = 1823314286320672463L;

    // 赛事ID
    private Integer mid;
    // 联赛id
    private Integer mLeagueId;
    //联赛名
    private String mLeague;
    // 主队名
    private String mbTeam;
    // 客队名
    private String tgTeam;
    // 游戏类型
    private String type;
    //开赛日期
    private Date mDate;
    //开赛时间
    private String mTime;
    //0正常 1取消
    private Integer status;
    //平台标识
    private String serverAdmin;
}
