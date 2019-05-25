package com.cn.great.model.user;

import lombok.Data;

import java.io.Serializable;

/**
 * @program: sport
 * @description: 保密问题字典
 * @author: Stamp
 * @create: 2019-04-04 16:38
 **/
@Data
public class QuestionEntity implements Serializable {

    private static final long serialVersionUID = 5495052325236471263L;
    //密保问题ID
    private Integer id;
    //密保问题
    private String name;

}
