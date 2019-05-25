package com.cn.great.service;

import com.cn.great.model.system.MessageTextEntity;
import com.cn.great.model.user.NoticesEntity;
import com.cn.great.req.bulletin.MessageReq;
import com.cn.great.req.bulletin.NoticesReq;

import java.text.ParseException;
import java.util.List;

/**
 * @Description: 会员管理Service接口
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */

public interface MessageService {

    /**
     * 列表结算
     * @param messageReq
     * @return
     */
    List<MessageTextEntity> fetchList(MessageReq messageReq);

    /**
     * 数量统计
     * @param messageReq
     * @return
     */
    Integer count(MessageReq messageReq);

    /**
     * 删除
     * @param id
     */
    void delete(Integer id);

    /**
     * 展示详情
     * @param id
     */
    MessageTextEntity view(Integer id);
}
