package com.cn.great.mapper.game;

import com.cn.great.model.game.MemberBkConfig;
import com.cn.great.model.game.MemberFtConfig;
import com.cn.great.req.game.MemberBKConfigReq;
import com.cn.great.req.game.MemberFTConfigReq;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: sportmanage
 * @description: 平台限额查询
 * @author: Stamp
 * @create: 2019-05-16 16:27
 **/
@Mapper
public interface PlatformLimitMapper {

    List<MemberBkConfig> fetchDefaultBKConfigs(@Param("id") Integer id);

    List<MemberFtConfig> fetchDefaultFTConfigs(@Param("id") Integer id);

    void addBkPlatformConfig(MemberBKConfigReq memberBKConfigReq);

    void updateBkPlatformConfig(MemberBKConfigReq memberBKConfigReq);

    void addFTPlatformConfig(MemberFTConfigReq memberFTConfigReq);

    void updateFTPlatformConfig(MemberFTConfigReq memberFTConfigReq);

}
