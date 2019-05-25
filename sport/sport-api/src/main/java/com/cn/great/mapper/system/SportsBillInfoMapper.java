package com.cn.great.mapper.system;

import com.cn.great.model.system.SportsBillInfo;

public interface SportsBillInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SportsBillInfo record);

    int insertSelective(SportsBillInfo record);

    SportsBillInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SportsBillInfo record);

    int updateByPrimaryKey(SportsBillInfo record);
}