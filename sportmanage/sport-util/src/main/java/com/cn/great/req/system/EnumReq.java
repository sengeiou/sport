package com.cn.great.req.system;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: sportmanage
 * @description: 参数配置查询
 * @author: Stamp
 * @create: 2019-05-22 11:19
 **/
@Data
public class EnumReq extends BaseEntity {

    private String code;
    private String typeCode;
    private String name;

}
