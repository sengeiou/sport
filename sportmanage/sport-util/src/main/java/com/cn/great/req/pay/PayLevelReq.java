package com.cn.great.req.pay;

import com.cn.great.model.common.BaseEntity;
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
public class PayLevelReq extends BaseEntity implements Serializable {

    private String levelName;
    private Date date;
    private Integer status;


}
