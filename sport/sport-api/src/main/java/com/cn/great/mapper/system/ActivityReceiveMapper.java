package com.cn.great.mapper.system;

import com.cn.great.model.system.ActivityReceive;

public interface ActivityReceiveMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ActivityReceive record);

    int insertSelective(ActivityReceive record);

    ActivityReceive selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ActivityReceive record);

    int updateByPrimaryKey(ActivityReceive record);
}