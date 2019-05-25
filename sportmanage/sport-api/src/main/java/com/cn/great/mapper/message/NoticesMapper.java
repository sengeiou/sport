package com.cn.great.mapper.message;


import com.cn.great.model.user.NoticesEntity;
import com.cn.great.req.bulletin.NoticesReq;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NoticesMapper {

     List<NoticesEntity> listAll(@Param(value = "alert") Integer alert);

     /**
      * 统计个数
      * @param noticesReq
      * @return
      */
     Integer count(@Param(value = "notices")NoticesReq noticesReq);

     /**
      * 根据查询条件获取列表
      * @param noticesReq
      * @return
      */
     List<NoticesEntity> selectByReq(@Param(value = "notices")NoticesReq noticesReq);

    void deleteById(int id);

    /**
     * 保存
     * @param noticesEntity
     */
    void save(NoticesEntity noticesEntity);

    /**
     * 修改
     * @param noticesEntity
     */
    void update(NoticesEntity noticesEntity);

    /**
     * 获得保存的id
     */
    Integer getMaxId();
}
