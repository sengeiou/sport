package com.cn.great.req.system;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: sportmanage
 * @description: 日志记录
 * @author: Stamp
 * @create: 2019-05-26 16:48
 **/
@Data
public class LogReq extends BaseEntity {
    private static final long serialVersionUID = -2975464619580499904L;

    private String userName;
    //0-管理员1-代理2-会员
    private Integer type;
    private String serverAdmin;
}
