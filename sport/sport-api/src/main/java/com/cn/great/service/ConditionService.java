package com.cn.great.service;

import com.cn.great.model.discount.ConditionEntity;

import java.math.BigDecimal;

/**
 * 红包活动业务
 */
public interface ConditionService {
    
        ConditionEntity ConditionById(int id);

        String monryInfo(Integer id, long time);

        int conditionModify(BigDecimal total, BigDecimal getMoney, int id, Integer userId, String ip,String admin);
}
