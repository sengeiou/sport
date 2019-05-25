package com.cn.great.mapper.system;

import com.cn.great.model.system.ActivityCondition;

public interface ActivityConditionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ActivityCondition record);

    int insertSelective(ActivityCondition record);

    ActivityCondition selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ActivityCondition record);

    int updateByPrimaryKey(ActivityCondition record);
}