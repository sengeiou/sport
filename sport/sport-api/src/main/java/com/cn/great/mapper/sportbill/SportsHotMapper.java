package com.cn.great.mapper.sportbill;

import com.cn.great.model.match.SportHotEntity;

import java.util.List;

public interface SportsHotMapper {
    int insert(SportHotEntity record);

    int insertSelective(SportHotEntity record);

    /**
     * 查询所有用于缓存
     * @return
     */
    List<SportHotEntity> queryAll();
}