package com.cn.great.req.user;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: sportmanage
 * @description: 管理员查询
 * @author: Stamp
 * @create: 2019-04-10 09:03
 **/
@Data
public class UserReq extends BaseEntity {

    private String userName;
    private String alias;
    private Integer status;

}
