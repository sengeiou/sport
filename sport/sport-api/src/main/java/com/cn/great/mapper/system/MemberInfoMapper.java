package com.cn.great.mapper.system;

import com.cn.great.model.system.MemberInfo;

public interface MemberInfoMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(MemberInfo record);

    int insertSelective(MemberInfo record);

    MemberInfo selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(MemberInfo record);

    int updateByPrimaryKey(MemberInfo record);
}