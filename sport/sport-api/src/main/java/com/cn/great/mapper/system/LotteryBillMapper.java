package com.cn.great.mapper.system;

import com.cn.great.model.system.LotteryBill;

public interface LotteryBillMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LotteryBill record);

    int insertSelective(LotteryBill record);

    LotteryBill selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LotteryBill record);

    int updateByPrimaryKey(LotteryBill record);
}