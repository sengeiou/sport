package com.cn.great.req.user;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: sportmanage
 * @description: 管理员查询
 * @author: Stamp
 * @create: 2019-04-10 09:03
 **/
@Data
public class ResetPwdReq extends BaseEntity {
    private String loginOldPassword;
    private String loginNewPassword;
    // 0 后台系统用户 1 代理用户 2 超级管理员
    private Integer flag;
    private String userName;
}
