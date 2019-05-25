package com.cn.great.mapper.user;


import com.cn.great.model.user.MoneyLogEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MoneyLogMapper {

    int addMoneyLog(MoneyLogEntity moneyLog);
}