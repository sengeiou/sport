package com.cn.great.mapper.system;

import com.cn.great.model.system.SportsBillHistory;

public interface SportsBillHistoryMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SportsBillHistory record);

    int insertSelective(SportsBillHistory record);

    SportsBillHistory selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SportsBillHistory record);

    int updateByPrimaryKey(SportsBillHistory record);
}