package com.cn.great.mapper.game;

import com.cn.great.model.game.MemberBkConfig;
import com.cn.great.model.game.MemberBkDeConfig;
import com.cn.great.model.game.MemberFtConfig;
import com.cn.great.model.game.MemberFtDeConfig;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: sportmanage
 * @description: 平台限额查询
 * @author: Stamp
 * @create: 2019-05-16 16:27
 **/
@Mapper
public interface PlatformLimitMapper {

    List<MemberBkConfig> fetchDefaultBKConfigs();

    List<MemberFtConfig> fetchDefaultFTConfigs();

    void addBkPlatformConfig(MemberBkConfig memberBkConfig);

    void addBkDePlatformConfig(MemberBkDeConfig memberBkDeConfig);

    void updateBkPlatformConfig(MemberBkConfig memberBkConfig);

    void updateBkDeConfig(MemberBkDeConfig memberBkDeConfig);

    void addFTPlatformConfig(MemberFtConfig memberFtConfig);

    void addFTDePlatformConfig(MemberFtDeConfig memberFtDeConfig);

    void updateFTPlatformConfig(MemberFtConfig memberFtConfig);

    void updateFTDeConfig(MemberFtDeConfig memberFtDeConfig);
}
