package com.cn.great.mapper.system;

import com.cn.great.model.system.LoginLog;

public interface LoginLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LoginLog record);

    int insertSelective(LoginLog record);

    LoginLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LoginLog record);

    int updateByPrimaryKey(LoginLog record);
}