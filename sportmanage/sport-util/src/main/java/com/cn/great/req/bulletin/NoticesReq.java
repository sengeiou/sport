package com.cn.great.req.bulletin;

import com.cn.great.model.common.BaseEntity;
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
public class NoticesReq extends BaseEntity implements Serializable {

    private static final long serialVersionUID = -4884300323260301077L;
    private Integer id;
    //内容
    private String context;
    private String title;
    //添加时间
    private String addDate;

    private String alert;


}
