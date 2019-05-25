package com.cn.great.mapper.system;

import com.cn.great.model.system.MemberBkConfig;

public interface MemberBkConfigMapper {
    int insert(MemberBkConfig record);

    int insertSelective(MemberBkConfig record);
}