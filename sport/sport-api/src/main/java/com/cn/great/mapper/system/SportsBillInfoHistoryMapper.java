package com.cn.great.mapper.system;

import com.cn.great.model.system.SportsBillInfoHistory;

public interface SportsBillInfoHistoryMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SportsBillInfoHistory record);

    int insertSelective(SportsBillInfoHistory record);

    SportsBillInfoHistory selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SportsBillInfoHistory record);

    int updateByPrimaryKey(SportsBillInfoHistory record);
}