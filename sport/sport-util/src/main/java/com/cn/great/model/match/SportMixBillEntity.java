package com.cn.great.model.match;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 体育注单表 - web_sports_bill
 */
@Data
public class SportMixBillEntity implements Serializable {

    private static final long serialVersionUID = 786660811167474974L;
    private Integer id;
    // 赛事ID
    private Integer mid;
    // 联赛id
    private Integer mLeagueId;
    //足球盘口类型 r 早盘 rb今日 re 滚球 or 冠军
    private String mType;
    // 赔率
    private String mRate;
    //
    private String mPlace;
    //下注球队H：主队；C客队| 或者波胆比分
    private String showType;
    //补充类型 如：最先最后进球中的最先还是最后
    private String type;
    //注单种类
    private String pType;
    //FT：足球；BK：篮球；TN：网球；VB：排球、羽毛球、乒乓球；BS：棒球；OP：其他
    private String gType;
    //主队得分
    private Integer mbBall;
    //客队得分
    private Integer tgBall;
    //0-未结算1-结算
    private Integer checked;
    //1-取消2-赛事腰斩3-赛事该期4-赛事延期5-赛事延赛6-赛事取消7-赛事无PK加时8-球员弃权9-队名错误10-主客场错误11-先发投手更换12-选手更换13-联赛名称错误14-盘口错误15-提前开赛16-比分错误17-未接受注单18-进球取消19-红卡取消20-非正常投注21-赔率错误
    private Integer confirmed;
    //主表注单号
    private String  orderNo;
    //开赛时间
    private Long mDate;

    //联赛名
    private String mLeagueName;
    //赛事名
    private String eventName;

}
