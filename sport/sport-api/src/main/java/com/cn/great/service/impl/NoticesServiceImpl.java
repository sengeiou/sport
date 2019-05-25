package com.cn.great.service.impl;

import com.cn.great.mapper.message.NoticesMapper;
import com.cn.great.mapper.system.MessageInfoMapper;
import com.cn.great.mapper.system.MessageTextMapper;
import com.cn.great.model.common.Constant;
import com.cn.great.model.system.MessageTextEntity;
import com.cn.great.model.user.NoticesEntity;
import com.cn.great.service.NoticesService;
import com.cn.great.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;


/**
 * @Description: 用户管理Service
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */
@Service
public class NoticesServiceImpl implements NoticesService {
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private NoticesMapper noticesMapper;
    @Autowired
    private MessageTextMapper messageTextMapper;
    @Autowired
    private MessageInfoMapper messageInfoMapper;


    @Override
    public List<NoticesEntity> listAll(Integer alert) {
        //从redis里面拿
        List<NoticesEntity> noticesEntities = (List<NoticesEntity>) redisUtil.get(Constant.NOTICE_STR);
        if (alert != null)
            noticesEntities = noticesEntities.stream().filter(p -> p.getAlert().equals(alert)).collect(Collectors.toList());
        //拿不到数据库查
        if (noticesEntities.size() == 0) noticesEntities = noticesMapper.listAll(alert);
        return noticesEntities;
    }

    /**
     * 查询未读消息条数---Chris
     *
     * @param id
     * @return
     */
    @Override
    public int getMessageNumber(Integer id) {
        return messageTextMapper.getMessageNumber(id);
    }

    /**
     * 查询所有消息---Chris
     *
     * @param id
     * @return
     */
    @Override
    public List<HashMap<String, String>> getMessageList(Integer id) {
        return messageTextMapper.getMessageList(id);
    }

    @Override
    public HashMap<String, Object> getMessageInfo(int id) {
        return messageTextMapper.messageById(id);
    }

    @Override
    public HashMap<String, String> getMessagereplyList(int id) {
        return messageTextMapper.getMessagereplyList(id);
    }

    @Transactional
    @Override
    public int deleteMessageById(int id) {
        int i = messageTextMapper.deleteByPrimaryKey(id);
        int primaryKey=0;      
        if (i > 0) {
             primaryKey = messageInfoMapper.deleteByPrimaryKey(id);
        }
        return primaryKey;
    }

    @Transactional
    @Override
    public int addMessageTextReply(MessageTextEntity message) {
        messageTextMapper.addMessageTextReply(message);
        System.out.println(message.getId() + "=============================================");
        int i = 0;
        if (message.getId() > 0) {
            i = messageInfoMapper.addMessageInfo(message.getId(), message.getToUser());
        }
        return i;
    }

    @Override
    public String selectTitleById(int id) {
        return messageTextMapper.selectTitleById(id);
    }

}
