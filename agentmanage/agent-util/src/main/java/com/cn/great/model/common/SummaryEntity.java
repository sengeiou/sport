package com.cn.great.model.common;

import lombok.Data;

import java.io.Serializable;

/**
 * @program: agentmanage
 * @description: 数据汇总基础类
 * @author: Stamp
 * @create: 2019-05-20 13:26
 **/
@Data
public class SummaryEntity implements Serializable {
    private static final long serialVersionUID = 236655282078991935L;
    //数据总计数组
    private String[] sumtotals;
}
