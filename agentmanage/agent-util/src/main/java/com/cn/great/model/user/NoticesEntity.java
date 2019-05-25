package com.cn.great.model.user;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @program: sport
 * @description: 站内信详情 对应web_message_data表
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class NoticesEntity implements Serializable {

    private static final long serialVersionUID = -4884300323260301077L;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer id;
    //内容
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String context;
    //标题
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String title;
    //添加时间
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss") //Jackson包使用注解
    private Date addDate;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String alert;

}
