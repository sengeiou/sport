package com.cn.great.mapper.system;

import com.cn.great.model.system.MatchCrownFt;

public interface MatchCrownFtMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MatchCrownFt record);

    int insertSelective(MatchCrownFt record);

    MatchCrownFt selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MatchCrownFt record);

    int updateByPrimaryKey(MatchCrownFt record);
}