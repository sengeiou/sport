package com.cn.great.mapper.system;

import com.cn.great.model.system.MessageTextEntity;
import org.apache.ibatis.annotations.Param;
import java.util.HashMap;
import java.util.List;

public interface MessageTextMapper {
    int deleteByPrimaryKey(@Param("id") Integer id);

    int insert(MessageTextEntity record);

    int insertSelective(MessageTextEntity record);

    MessageTextEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MessageTextEntity record);

    int updateByPrimaryKeyWithBLOBs(MessageTextEntity record);

    int updateByPrimaryKey(MessageTextEntity record);

    /**
     * 查询未读消息条数 --Chris
     * @param id
     * @return
     */
    int getMessageNumber(@Param("id") Integer id);

    /**
     * 查询所有消息 --Chris
     * @param id
     * @return
     */
    List<HashMap<String,String>> getMessageList(@Param("id") Integer id);

    HashMap<String,Object> messageById(@Param("id") Integer id);

    HashMap<String, String> getMessagereplyList(@Param("id") int id);

    String selectTitleById(@Param("id") int id);

    int addMessageTextReply(MessageTextEntity message);
}