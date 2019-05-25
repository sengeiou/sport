package com.cn.great.model.system;

import lombok.Data;

import java.io.Serializable;

/**
 * @program: sportmanage
 * @description: 参数类型
 * @author: Stamp
 * @create: 2019-05-22 11:21
 **/
@Data
public class EnumType implements Serializable {
    private static final long serialVersionUID = -1420525524738512162L;

    private String code;
    private String name;
}
