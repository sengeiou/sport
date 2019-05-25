package com.cn.great.mapper.system;

import com.cn.great.model.system.MoneyChangeType;

public interface MoneyChangeTypeMapper {
    int deleteByPrimaryKey(Byte id);

    int insert(MoneyChangeType record);

    int insertSelective(MoneyChangeType record);

    MoneyChangeType selectByPrimaryKey(Byte id);

    int updateByPrimaryKeySelective(MoneyChangeType record);

    int updateByPrimaryKey(MoneyChangeType record);
}