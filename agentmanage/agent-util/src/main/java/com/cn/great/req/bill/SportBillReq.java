package com.cn.great.req.bill;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: agentmanage
 * @description: 真人荷官注单查询
 * @author: Stamp
 * @create: 2019-05-19 15:28
 **/
@Data
public class SportBillReq extends BaseEntity {
    private String orderNo;
    private String gType;
    private String pType;
    //0-未结算1-结算
    private Integer checked;
    // 用户名
    private String userName;

    private Integer confirmed;
}
