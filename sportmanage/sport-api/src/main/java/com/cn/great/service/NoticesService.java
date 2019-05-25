package com.cn.great.service;

import com.cn.great.model.user.NoticesEntity;
import com.cn.great.req.bulletin.NoticesReq;

import java.text.ParseException;
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
     * 列表查询页数用 汇总数量
     * @param noticesReq
     * @return
     * @throws ParseException
     */
    Integer count(NoticesReq noticesReq) throws ParseException;

    /**
     * 列表查询
     * @param noticesReq
     * @return
     * @throws ParseException
     */
    List<NoticesEntity> fetchList(NoticesReq noticesReq) throws ParseException;

    /**
     * 删除
     * @param id
     * @return
     */
    void delete(Integer id);

    /**
     * 新增
     * @param noticesEntity
     */
    void save(NoticesEntity noticesEntity);

    /**
     * 修改
     * @param noticesEntity
     */
    void update(NoticesEntity noticesEntity);
}
