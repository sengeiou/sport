package com.cn.great.req.user;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @program: sportManage
 * @description: 会员等级操作
 * @author: Stamp
 * @create: 2019-04-02 13:51
 **/
@Data
public class LevelOpeReq extends BaseEntity {

    //累计存款
    private BigDecimal sumMoney;
    //累计打码
    private BigDecimal sumBet;
    //会员等级
    private Integer memLevel;
    //备注
    private String notes;
    //总代理
    private String serverAdmin;

}
