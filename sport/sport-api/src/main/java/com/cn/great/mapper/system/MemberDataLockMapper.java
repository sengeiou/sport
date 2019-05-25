package com.cn.great.mapper.system;

import com.cn.great.model.system.MemberDataLock;

public interface MemberDataLockMapper {
    int insert(MemberDataLock record);

    int insertSelective(MemberDataLock record);
}