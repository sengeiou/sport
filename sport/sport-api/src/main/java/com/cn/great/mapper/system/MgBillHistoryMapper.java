package com.cn.great.mapper.system;

import com.cn.great.model.system.MgBillHistory;

public interface MgBillHistoryMapper {
    int insert(MgBillHistory record);

    int insertSelective(MgBillHistory record);
}