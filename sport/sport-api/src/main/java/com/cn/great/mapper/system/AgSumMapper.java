package com.cn.great.mapper.system;

import com.cn.great.model.system.AgSum;

public interface AgSumMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AgSum record);

    int insertSelective(AgSum record);

    AgSum selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AgSum record);

    int updateByPrimaryKey(AgSum record);
}