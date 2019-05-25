package com.cn.great.mapper.sportbill;

import com.cn.great.model.match.SportsShieldEntity;

import java.util.List;

public interface SportsShieldMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SportsShieldEntity record);

    int insertSelective(SportsShieldEntity record);

    SportsShieldEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SportsShieldEntity record);

    int updateByPrimaryKey(SportsShieldEntity record);
    /**
     * 查询所有用于缓存
     * @return
     */
    List<SportsShieldEntity> queryAll();
}