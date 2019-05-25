package com.cn.great.mapper.system;

import com.cn.great.model.system.LotteryBillHistory;

public interface LotteryBillHistoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LotteryBillHistory record);

    int insertSelective(LotteryBillHistory record);

    LotteryBillHistory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LotteryBillHistory record);

    int updateByPrimaryKey(LotteryBillHistory record);
}