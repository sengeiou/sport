package com.cn.great.mapper.system;

import com.cn.great.model.system.MemberData;

public interface MemberDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MemberData record);

    int insertSelective(MemberData record);

    MemberData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemberData record);

    int updateByPrimaryKey(MemberData record);
}