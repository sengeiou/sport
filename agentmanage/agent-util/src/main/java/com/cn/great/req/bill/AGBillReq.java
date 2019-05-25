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
public class AGBillReq extends BaseEntity {
    private String billno;
    private String gameCode;
}
