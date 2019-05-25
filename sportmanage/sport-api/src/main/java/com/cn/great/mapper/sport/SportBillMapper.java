package com.cn.great.mapper.sport;



import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;


@Mapper
public interface SportBillMapper {

    BigDecimal countUserBetting(@Param("userId")Integer userId, @Param("startTime")Long startTime);
}
