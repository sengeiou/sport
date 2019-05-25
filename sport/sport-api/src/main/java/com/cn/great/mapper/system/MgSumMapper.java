package com.cn.great.mapper.system;

import com.cn.great.model.system.MgSum;

public interface MgSumMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MgSum record);

    int insertSelective(MgSum record);

    MgSum selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MgSum record);

    int updateByPrimaryKey(MgSum record);
}