package com.cn.great.model.common;

import lombok.Data;

import java.io.Serializable;

@Data
public class BaseEntity implements Serializable {

    private static final long serialVersionUID = -2640614494974637739L;

    private Integer start;

    private Integer length;

    private String beginTime;

    private String endTime;

    //主键 id
    private Integer id;

    //总代理
    private String serverAdmin;

}
