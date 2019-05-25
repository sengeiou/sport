package com.cn.great.mapper.system;

import com.cn.great.model.system.MgConfig;

public interface MgConfigMapper {
    int insert(MgConfig record);

    int insertSelective(MgConfig record);
}