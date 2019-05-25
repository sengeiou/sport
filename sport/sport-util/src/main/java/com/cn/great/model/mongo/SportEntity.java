package com.cn.great.model.mongo;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * mongodb赛事表 - mongodb_sport
 */
@Data
@Builder
@Document(collection = "sport")
public class SportEntity implements Serializable {

    private static final long serialVersionUID = 786660811167474974L;
    // 赛事ID
    private Integer mid;
    // 联赛id
    private Integer mleagueid;
    //联赛名
    private String mleague;
    // 主队名
    private String mbteam;
    //客队名
    private String tgteam;
    // 开赛日
    private String mdate;
    // 开赛时间
    private String mtime;
    // 开赛日时间戳
    private Long datetimes;
    // 用于删除不同于本次刷水数据
    private Long deletimes;
    //直播
    private Boolean tv;
    // 玩法
    private String nums;
    //球赛种类 ft足球 bk篮球
    private String type;
    //球赛类型 re滚球 rb今日 r早盘 or冠军
    private String mtype;
    //玩法 独赢 大小 单双等
    private String ptype;
    //滚球进行时 主队得分
    private String score1;
    //	滚球进行时 客队得分
    private String score2;
    //场次中文
    private String times;
    //场次数字 0全场 1第一次。。。。。5加时赛，6半场 主要用于篮球，足球使用玩法盘口确定
    private Integer times_num;
    //特殊玩法中文
    private String pcimid;
    //独赢
    private String ftht;
    //半场独赢
    private String fthtlst;
    //让球
    private String ah;
    //半场让球
    private String ahlst;
    //大小
    private String ou;
    //半场大小
    private String oulst;
    //单双
    private String oe;
    //半场单双
    private String oelst;
    //波胆
    private String cs;
    //半场全场
    private String hf;
    //总入球
    private String tg;
    //半场总入球
    private String tglst;
    //最先进球最后进球
    private String fglg;
}
