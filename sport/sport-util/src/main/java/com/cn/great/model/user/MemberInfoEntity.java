package com.cn.great.model.user;

import lombok.Data;

import java.io.Serializable;

/**
 * @program: sport
 * @description: 会员副表 对应web_member_info表
 * @author: Stamp
 * @create: 2019-04-02 13:51
 **/
@Data
public class MemberInfoEntity implements Serializable {

    private static final long serialVersionUID = -4352212513106210192L;
    //对应会员主表ID
    private Integer userId;
    //用户名
    private String userName;
    //注册时间
    private String addDate;
    //生日
    private String birthday;
    //提款密码
    private String withdrawalPasswd;
    //会员备注
    private String notes;
    //0-未开通AG1-开通AG
    private Integer agopen;
    //0-彩票未开通1-彩票已开通
    private Integer cpopen;
    //0-MG未开通1-MG已开通
    private Integer mgopen;
    //加密的姓名
    private String alias;
    //0-正式会员1-测试会员
    private Integer testFlag;
    //注册ip
    private String regIp;
    //默认银行卡ID
    private Integer bankId;
    //VIP等级
    private Integer vipLevel;
    //密保问题，关联web_question_data
    private Integer question;
    //密保问题答案
    private String answer;
    //收藏赛事
    private String collection;
    //最新一次获取站内信的时间
    private String messageTime;
    // 历史盈亏
    private Integer hisLoss;
    // 历史打码
    private Integer hisBets;

}
