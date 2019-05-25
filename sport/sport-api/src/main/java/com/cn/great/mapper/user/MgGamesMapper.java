package com.cn.great.mapper.user;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
@Mapper
public interface MgGamesMapper {

    List<Map<String,Object>> listByType(@Param("terminal") String terminal);
}