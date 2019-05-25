package com.cn.great.mapper.system;

import com.cn.great.model.system.BannerData;

public interface BannerDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BannerData record);

    int insertSelective(BannerData record);

    BannerData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BannerData record);

    int updateByPrimaryKey(BannerData record);
}