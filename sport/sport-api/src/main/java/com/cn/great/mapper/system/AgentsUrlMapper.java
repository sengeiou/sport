package com.cn.great.mapper.system;

import com.cn.great.model.system.AgentsUrl;

public interface AgentsUrlMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AgentsUrl record);

    int insertSelective(AgentsUrl record);

    AgentsUrl selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AgentsUrl record);

    int updateByPrimaryKey(AgentsUrl record);
}