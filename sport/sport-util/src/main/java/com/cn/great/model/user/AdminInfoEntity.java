package com.cn.great.model.user;

import lombok.Data;

import java.io.Serializable;

/**
 * @program: sport
 * @description: 管理员信息类 对应 web_system_data表
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class AdminInfoEntity implements Serializable {

    private static final long serialVersionUID = -3008105175210268684L;
    private Integer id;
    // 用户名
    private String userName;
    // 注册时间
    private String addDate;
    // 登陆密码
    private String password;
    // 类型 0-超级管理员，1-普通管理员
    private String type;
    // 管理员明码名字
    private String alias;
    // 状态 0-正常1-冻结2-伪删除
    private Integer status;
    // 总代理
    private String serverAdmin;

}
