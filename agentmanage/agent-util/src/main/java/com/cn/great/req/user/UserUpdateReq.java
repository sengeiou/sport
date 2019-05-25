package com.cn.great.req.user;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @program: sport
 * @description: 新增后台管理员
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class UserUpdateReq extends BaseEntity {

    @NotBlank
    private Integer id;
    // 用户名
    @NotBlank
    private String userName;
    // 登陆密码
    private String password;
    // 类型 0-超级管理员，1-普通管理员
    @NotBlank
    private String type;
    // 管理员明码名字
    @NotBlank
    private String alias;
    // 总代理
    @NotBlank
    private String serverAdmin;
    // 注册时间
    private String addDate;
    // 状态 0-正常1-冻结2-伪删除
    private Integer status;

}
