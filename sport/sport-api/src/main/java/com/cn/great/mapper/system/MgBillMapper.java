package com.cn.great.mapper.system;

import com.cn.great.model.system.MgBill;

public interface MgBillMapper {
    int insert(MgBill record);

    int insertSelective(MgBill record);
}