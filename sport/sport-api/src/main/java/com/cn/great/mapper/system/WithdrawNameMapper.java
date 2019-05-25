package com.cn.great.mapper.system;

import com.cn.great.model.system.WithdrawName;

public interface WithdrawNameMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WithdrawName record);

    int insertSelective(WithdrawName record);

    WithdrawName selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WithdrawName record);

    int updateByPrimaryKey(WithdrawName record);
}