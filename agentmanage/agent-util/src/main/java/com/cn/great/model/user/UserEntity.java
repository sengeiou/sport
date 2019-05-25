package com.cn.great.model.user;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @program: agentmanage
 * @description: 会员完整信息类
 * @author: Stamp
 * @create: 2019-05-14 13:53
 **/
@Data
public class UserEntity implements Serializable {

    private static final long serialVersionUID = 2997204156899130878L;

    private Integer id;
    // 用户名
    private String userName;
    // 会员余额
    private BigDecimal money;
    // 额度修复临时额度
    private BigDecimal money2;
    // 上级代理ID
    private Integer agentId;
    // 累计存款次数
    private Integer ctime;
    // 累计存款金额
    private BigDecimal cmoney;
    // 累计提款次数
    private Integer ttime;
    // 累计提款金额
    private BigDecimal tmoney;
    // 累计打码
    private Integer sumBet;
    // 登陆密码
    private String password;
    // 支付分层
    private Integer levelId;
    // 出款备注
    private String notesWithdrawal;
    // 状态 0-正常1-冻结2-伪删除
    private Integer status;
    // 总代理
    private String serverAdmin;

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
    //限制篮球下注 0不限制 1限制第三节第四节
    private Integer limitBk;
    //限制足球下注 0不限制 1限制
    private Integer limitFt;
}
