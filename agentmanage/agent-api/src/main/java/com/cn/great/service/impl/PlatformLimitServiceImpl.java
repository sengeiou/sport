package com.cn.great.service.impl;

import com.cn.great.mapper.game.PlatformLimitMapper;
import com.cn.great.model.game.MemberBkConfig;
import com.cn.great.model.game.MemberFtConfig;
import com.cn.great.req.game.MemberBKConfigReq;
import com.cn.great.req.game.MemberFTConfigReq;
import com.cn.great.service.PlatformLimitService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: sportmanage
 * @description: 平台限额
 * @author: Stamp
 * @create: 2019-05-16 16:28
 **/
@Service
@Slf4j
public class PlatformLimitServiceImpl implements PlatformLimitService {

    @Resource
    private PlatformLimitMapper platformLimitMapper;

    @Override
    public List<MemberBkConfig> fetchDefaultBKConfigs(Integer id) {
        return platformLimitMapper.fetchDefaultBKConfigs(id);
    }

    @Override
    public List<MemberFtConfig> fetchDefaultFTConfigs(Integer id) {
        return platformLimitMapper.fetchDefaultFTConfigs(id);
    }

    @Transactional
    @Override
    public void addBkPlatformConfig(MemberBKConfigReq memberBkConfig) {
        platformLimitMapper.addBkPlatformConfig(memberBkConfig);
    }

    @Transactional
    @Override
    public void updateBkPlatformConfig(MemberBKConfigReq memberBkConfig) {
        platformLimitMapper.updateBkPlatformConfig(memberBkConfig);
    }

    @Transactional
    @Override
    public void addFTPlatformConfig(MemberFTConfigReq memberFTConfigReq) {
        platformLimitMapper.addFTPlatformConfig(memberFTConfigReq);
    }

    @Transactional
    @Override
    public void updateFTPlatformConfig(MemberFTConfigReq memberFTConfigReq) {
        platformLimitMapper.updateFTPlatformConfig(memberFTConfigReq);
    }
}
