package com.cn.great.mapper.system;

import com.cn.great.model.system.LotterySum;

public interface LotterySumMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LotterySum record);

    int insertSelective(LotterySum record);

    LotterySum selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LotterySum record);

    int updateByPrimaryKey(LotterySum record);
}