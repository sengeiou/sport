package com.cn.great.mapper.system;

import com.cn.great.model.system.ScoreSportsBk;

public interface ScoreSportsBkMapper {
    int deleteByPrimaryKey(Integer mid);

    int insert(ScoreSportsBk record);

    int insertSelective(ScoreSportsBk record);

    ScoreSportsBk selectByPrimaryKey(Integer mid);

    int updateByPrimaryKeySelective(ScoreSportsBk record);

    int updateByPrimaryKey(ScoreSportsBk record);
}