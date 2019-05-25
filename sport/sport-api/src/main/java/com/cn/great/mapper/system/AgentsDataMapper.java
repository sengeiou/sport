package com.cn.great.mapper.system;

import com.cn.great.model.system.AgentsData;

public interface AgentsDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AgentsData record);

    int insertSelective(AgentsData record);

    AgentsData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AgentsData record);

    int updateByPrimaryKey(AgentsData record);
}