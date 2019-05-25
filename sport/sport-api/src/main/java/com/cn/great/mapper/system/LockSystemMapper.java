package com.cn.great.mapper.system;

import com.cn.great.model.system.LockSystem;

public interface LockSystemMapper {
    int insert(LockSystem record);

    int insertSelective(LockSystem record);
}