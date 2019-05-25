package com.cn.great.req.bill;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

/**
 * @program: agentmanage
 * @description: MG注单查询
 * @author: Stamp
 * @create: 2019-05-19 15:28
 **/
@Data
public class MGBillReq extends BaseEntity {
    private Long colid;
    private String type;
    private Long startTime;
    private Long finalTime;
}
