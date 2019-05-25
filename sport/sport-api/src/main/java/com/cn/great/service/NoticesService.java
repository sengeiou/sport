package com.cn.great.service;

import com.cn.great.model.system.MessageTextEntity;
import com.cn.great.model.user.NoticesEntity;
import com.cn.great.req.message.MessageReq;

import java.util.HashMap;
import java.util.List;

/**
 * @Description: 会员管理Service接口
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */

public interface NoticesService {

    /**
     * 查询所有未删除的消息
     * @return
     * @param alert
     */
    List<NoticesEntity> listAll(Integer alert);


    /**
     * 查询未读消息条数  ----Chris
     * @param id
     * @return
     */
    int getMessageNumber(Integer id);

    List<HashMap<String,String>> getMessageList(Integer id);

    HashMap<String,Object> getMessageInfo(int id);

    HashMap<String,String> getMessagereplyList(int id);

    int deleteMessageById(int id);

    int addMessageTextReply(MessageTextEntity message);
    
    String selectTitleById(int id);

}
