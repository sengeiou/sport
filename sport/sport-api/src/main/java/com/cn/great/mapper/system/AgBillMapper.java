package com.cn.great.mapper.system;

import com.cn.great.model.system.AgBill;

public interface AgBillMapper {
    int deleteByPrimaryKey(Long id);

    int insert(AgBill record);

    int insertSelective(AgBill record);

    AgBill selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AgBill record);

    int updateByPrimaryKey(AgBill record);
}