package com.cn.great.service.impl;

import com.cn.great.mapper.system.MessageInfoMapper;
import com.cn.great.mapper.system.MessageTextMapper;
import com.cn.great.model.system.MessageInfoEntity;
import com.cn.great.model.system.MessageTextEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.bulletin.MessageReq;
import com.cn.great.service.MessageService;
import com.cn.great.service.UserService;
import com.sun.nio.sctp.MessageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;


/**
 * @Description: 用户管理Service
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */
@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    MessageTextMapper messageTextMapper;
    @Autowired
    MessageInfoMapper messageInfoMapper;
    @Autowired
    UserService userService;
    @Override
    public List<MessageTextEntity> fetchList(MessageReq messageReq) {
        Map<Integer,String> userMap=new HashMap<>();
        List<UserInfoEntity> users=userService.fetchAllUsers();
        users.forEach(p->userMap.put(p.getId(),p.getUserName()));
        List<MessageTextEntity> list=messageTextMapper.fetchList(messageReq);
        for(MessageTextEntity text:list){
            text.setFromUserName(userMap.get(text.getFromUser()));
            StringBuffer toUsers=new StringBuffer();
            for(String uname:text.getToUser().split(",")){
                if(uname.equals("0")){
                    toUsers.append(",").append("全部会员");
                }else if(StringUtils.isNotBlank(userMap.get(Integer.parseInt(uname)))){
                    toUsers.append(",").append(userMap.get(Integer.parseInt(uname)));
                }

            }
            if(toUsers.length()>0){
                text.setToUserName(toUsers.deleteCharAt(0).toString());
            }

        }
        return list;

    }

    @Override
    public Integer count(MessageReq messageReq) {
        return messageTextMapper.count(messageReq);
    }

    @Override
    public void delete(Integer id) {
        messageTextMapper.delete(id);
    }

    @Override
    public MessageTextEntity view(Integer id) {
        Map<Integer,String> userMap=new HashMap<>();
        List<UserInfoEntity> users=userService.fetchAllUsers();
        users.forEach(p->userMap.put(p.getId(),p.getUserName()));
        MessageTextEntity entity=messageTextMapper.selectByPrimaryKey(id);
        entity.setFromUserName(userMap.get(entity.getFromUser()));
        List<MessageInfoEntity> list=messageInfoMapper.selectByMessageId(id);
        list.forEach(p->p.setUsername(userMap.get(Integer.parseInt(p.getUserid()))));
        entity.setInfos(list);
        return entity;
    }
}
