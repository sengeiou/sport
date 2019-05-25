package com.cn.great.req.system;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: sportmanage
 * @description: 参数操作
 * @author: Stamp
 * @create: 2019-05-22 14:29
 **/
@Data
public class EnumOpeReq extends BaseEntity {

    private Integer id;
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

    private Integer sort;
}
