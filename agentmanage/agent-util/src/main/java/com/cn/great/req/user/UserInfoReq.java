package com.cn.great.req.user;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: agentmanage
 * @description: 会员查询
 * @author: Stamp
 * @create: 2019-04-10 09:03
 **/
@Data
public class UserInfoReq extends BaseEntity {

    private String userName;
    private String alias;
    private Integer status;
    //限制篮球下注类型 1 篮球；2 足球
    private Integer type;
    //限制下注 0不限制 1限制
    private Integer value;

}
