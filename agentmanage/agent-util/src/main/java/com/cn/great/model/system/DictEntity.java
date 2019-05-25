package com.cn.great.model.system;

import lombok.Data;

import java.io.Serializable;

/**
 * @program: sport
 * @description: 站内信详情 对应web_message_data表
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class DictEntity implements Serializable {

    private static final long serialVersionUID = -4884300323260301077L;
    //编码
    private String code;
    //类型编码
    private String typeCode;
    //显示值
    private String name;
    //真实值
    private String value;
    //是否固定 0=固定 1-不固定
    private Integer fixed;
    //类型名称
    private String typeName;

}
