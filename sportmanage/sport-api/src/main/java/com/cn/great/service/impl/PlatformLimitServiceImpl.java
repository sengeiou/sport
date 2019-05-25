package com.cn.great.service.impl;

import com.cn.great.mapper.game.PlatformLimitMapper;
import com.cn.great.model.game.MemberBkConfig;
import com.cn.great.model.game.MemberBkDeConfig;
import com.cn.great.model.game.MemberFtConfig;
import com.cn.great.model.game.MemberFtDeConfig;
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
    public List<MemberBkConfig> fetchDefaultBKConfigs() {
        return platformLimitMapper.fetchDefaultBKConfigs();
    }

    @Override
    public List<MemberFtConfig> fetchDefaultFTConfigs() {
        return platformLimitMapper.fetchDefaultFTConfigs();
    }

    @Transactional
    @Override
    public void addBkPlatformConfig(MemberBkConfig memberBkConfig) {
        platformLimitMapper.addBkPlatformConfig(memberBkConfig);
    }

    @Transactional
    @Override
    public void addBkDePlatformConfig(MemberBkDeConfig memberBkDeConfig) {
        platformLimitMapper.addBkDePlatformConfig(memberBkDeConfig);
    }

    @Transactional
    @Override
    public void updateBkPlatformConfig(MemberBkConfig memberBkConfig) {
        platformLimitMapper.updateBkPlatformConfig(memberBkConfig);
    }

    @Transactional
    @Override
    public void updateBkDeConfig(MemberBkDeConfig memberBkDeConfig) {
        platformLimitMapper.updateBkDeConfig(memberBkDeConfig);
    }

    @Transactional
    @Override
    public void addFTPlatformConfig(MemberFtConfig memberFtConfig) {
        platformLimitMapper.addFTPlatformConfig(memberFtConfig);
    }

    @Transactional
    @Override
    public void addFTDePlatformConfig(MemberFtDeConfig memberFtDeConfig) {
        platformLimitMapper.addFTDePlatformConfig(memberFtDeConfig);
    }

    @Transactional
    @Override
    public void updateFTPlatformConfig(MemberFtConfig memberFtConfig) {
        platformLimitMapper.updateFTPlatformConfig(memberFtConfig);
    }

    @Transactional
    @Override
    public void updateFTDeConfig(MemberFtDeConfig memberFtDeConfig) {
        platformLimitMapper.updateFTDeConfig(memberFtDeConfig);
    }
}
