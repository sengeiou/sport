package com.cn.great.mapper.system;

import com.cn.great.model.system.RulesInfo;

public interface RulesInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RulesInfo record);

    int insertSelective(RulesInfo record);

    RulesInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RulesInfo record);

    int updateByPrimaryKey(RulesInfo record);
}