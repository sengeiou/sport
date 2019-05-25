package com.cn.great.mapper.discount;

import com.cn.great.model.discount.ConditionEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ConditionMapper {
    
    ConditionEntity ConditionById(@Param("id") int id);

    String moneyInfo(@Param("id") Integer id,@Param("time") long time);

    int conditionModify(@Param("id") int id,@Param("ran") double ran);
}
