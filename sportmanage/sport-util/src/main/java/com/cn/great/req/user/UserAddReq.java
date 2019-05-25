package com.cn.great.req.user;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * @program: sport
 * @description: 新增后台管理员
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class UserAddReq extends BaseEntity {

    private Integer id;
    // 用户名
    @NotBlank
    private String userName;
    // 登陆密码
    @NotBlank
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

}
