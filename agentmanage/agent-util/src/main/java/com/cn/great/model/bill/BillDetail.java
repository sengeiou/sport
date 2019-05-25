package com.cn.great.model.bill;

import lombok.Data;

/**
 * @program: agentmanage
 * @description: 注单明细
 * @author: Stamp
 * @create: 2019-05-21 17:10
 **/
@Data
public class BillDetail {
    private String mid;
    private String type;
    private String mdate;
    private String mtype;
    private String mbteam;
    private String tgteam;
    private String bettime;
    private String billVal;
    private String mleague;
    private String billteam;
    private String billTitle;
    private String mleagueid;
}
