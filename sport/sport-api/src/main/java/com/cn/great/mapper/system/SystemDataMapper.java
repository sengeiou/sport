package com.cn.great.mapper.system;

import com.cn.great.model.system.SystemData;

public interface SystemDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SystemData record);

    int insertSelective(SystemData record);

    SystemData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SystemData record);

    int updateByPrimaryKey(SystemData record);
}