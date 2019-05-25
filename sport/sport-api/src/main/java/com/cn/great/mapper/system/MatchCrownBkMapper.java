package com.cn.great.mapper.system;

import com.cn.great.model.system.MatchCrownBk;

public interface MatchCrownBkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MatchCrownBk record);

    int insertSelective(MatchCrownBk record);

    MatchCrownBk selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MatchCrownBk record);

    int updateByPrimaryKey(MatchCrownBk record);
}