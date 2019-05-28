package com.cn.great.model.system;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @program: sportmanage
 * @description: 日志记录
 * @author: Stamp
 * @create: 2019-05-26 16:48
 **/
@Data
public class LogInfo implements Serializable {
    private static final long serialVersionUID = -2975464619580499904L;

    private String id;
    private Integer userId;
    private String userName;
    private String ip;
    private Date dateTime;
    private String url;
    private String param;
    //0-管理员1-代理2-会员
    private Integer type;
    private String serverAdmin;

}
