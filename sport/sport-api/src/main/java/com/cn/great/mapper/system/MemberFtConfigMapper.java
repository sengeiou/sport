package com.cn.great.mapper.system;

import com.cn.great.model.system.MemberFtConfig;

public interface MemberFtConfigMapper {
    int insert(MemberFtConfig record);

    int insertSelective(MemberFtConfig record);
}