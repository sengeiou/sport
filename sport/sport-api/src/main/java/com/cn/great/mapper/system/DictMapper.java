package com.cn.great.mapper.system;


import com.cn.great.model.system.DictEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DictMapper {

     List<DictEntity> listByObj(@Param("dict") DictEntity dict);
}
