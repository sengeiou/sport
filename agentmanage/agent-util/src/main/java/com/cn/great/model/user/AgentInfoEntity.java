package com.cn.great.model.user;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @program: sport
 * @description: 代理信息类 对应web_agents_data表
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class AgentInfoEntity implements Serializable {

    private static final long serialVersionUID = 3409180776126118472L;
    private Integer id;
    // 用户名
    private String userName;
    // 余额
    private BigDecimal money;
    // 登陆密码
    private String password;
    // 取款密码
    private String passwordSafe;
    // 注册时间
    private String addDate;
    // 中文名
    private String alias;
    //关联银行卡ID
    private Integer bankId;
    // 注释
    private String notes;
    // 总代理
    private String serverAdmin;
    // 手机号
    private String phone;
    // 状态 0-正常1-冻结2-伪删除
    private Integer status;

}
