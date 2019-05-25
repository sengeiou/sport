package com.cn.great.mapper.system;

import com.cn.great.model.system.ScoreChangeFt;

public interface ScoreChangeFtMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ScoreChangeFt record);

    int insertSelective(ScoreChangeFt record);

    ScoreChangeFt selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ScoreChangeFt record);

    int updateByPrimaryKey(ScoreChangeFt record);
}