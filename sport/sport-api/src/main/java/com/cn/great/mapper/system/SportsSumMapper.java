package com.cn.great.mapper.system;

import com.cn.great.model.system.SportsSum;

public interface SportsSumMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SportsSum record);

    int insertSelective(SportsSum record);

    SportsSum selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SportsSum record);

    int updateByPrimaryKey(SportsSum record);
}