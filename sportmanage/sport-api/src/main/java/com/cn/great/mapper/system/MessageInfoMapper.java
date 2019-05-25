package com.cn.great.mapper.system;

import com.cn.great.model.system.MessageInfoEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MessageInfoEntity record);

    int insertSelective(MessageInfoEntity record);

    MessageInfoEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MessageInfoEntity record);

    int updateByPrimaryKey(MessageInfoEntity record);

    int addMessageInfo(@Param("id") int id, @Param("userId") Integer useriId);

    List<MessageInfoEntity> selectByMessageId(@Param("messageId")Integer messageId);
}