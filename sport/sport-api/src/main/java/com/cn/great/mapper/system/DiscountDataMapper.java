package com.cn.great.mapper.system;

import com.cn.great.model.system.DiscountData;

public interface DiscountDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DiscountData record);

    int insertSelective(DiscountData record);

    DiscountData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DiscountData record);

    int updateByPrimaryKeyWithBLOBs(DiscountData record);

    int updateByPrimaryKey(DiscountData record);
}