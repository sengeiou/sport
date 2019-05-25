package com.cn.great.mapper.system;

import com.cn.great.model.system.MatchLeague;

public interface MatchLeagueMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MatchLeague record);

    int insertSelective(MatchLeague record);

    MatchLeague selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MatchLeague record);

    int updateByPrimaryKey(MatchLeague record);
}