package com.cn.great.mapper.system;

import com.cn.great.model.system.MessageInfo;
import org.apache.ibatis.annotations.Param;

public interface MessageInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MessageInfo record);

    int insertSelective(MessageInfo record);

    MessageInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MessageInfo record);

    int updateByPrimaryKey(MessageInfo record);

    int addMessageInfo(@Param("id") int id,@Param("userId") Integer useriId);
}