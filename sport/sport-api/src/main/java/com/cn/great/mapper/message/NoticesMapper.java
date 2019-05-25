package com.cn.great.mapper.message;


import com.cn.great.model.user.NoticesEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface NoticesMapper {

     List<NoticesEntity> listAll(@Param(value="alert")Integer alert);

}
