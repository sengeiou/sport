package com.cn.great.model.user;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @program: sport
 * @description: 会员信息类 对应web_member_data表
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class UserInfoEntity implements Serializable {

    private static final long serialVersionUID = -4884300323260301077L;
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
}
