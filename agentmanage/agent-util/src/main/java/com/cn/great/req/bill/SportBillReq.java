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
    private Integer orderNo;
    private String gType;
    private String pType;
}
