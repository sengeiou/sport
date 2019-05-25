package com.cn.great.req.bulletin;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

import java.io.Serializable;

/**
 * @program: sport
 * @description: 站内信详情 对应web_message_data表
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class MessageReq extends BaseEntity {
    //内容
    private String fromUser;
    private String title;
    private Integer fromUserId;


}
