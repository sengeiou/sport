package com.cn.great.mapper.system;

import com.cn.great.model.system.AgBillHistory;

public interface AgBillHistoryMapper {
    int deleteByPrimaryKey(Long id);

    int insert(AgBillHistory record);

    int insertSelective(AgBillHistory record);

    AgBillHistory selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AgBillHistory record);

    int updateByPrimaryKey(AgBillHistory record);
}