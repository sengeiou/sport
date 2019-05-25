package com.cn.great.mapper.system;

import com.cn.great.model.system.AgConfig;

public interface AgConfigMapper {
    int insert(AgConfig record);

    int insertSelective(AgConfig record);
}