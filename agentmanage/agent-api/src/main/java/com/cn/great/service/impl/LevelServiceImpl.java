package com.cn.great.service.impl;

import com.cn.great.mapper.user.LevelMapper;
import com.cn.great.model.common.BaseEntity;
import com.cn.great.model.user.MemberLevelEntity;
import com.cn.great.req.user.LevelOpeReq;
import com.cn.great.service.LevelService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: agentmanage
 * @description: 会员等级serviceimpl
 * @author: Stamp
 * @create: 2019-04-17 11:16
 **/
@Service
@Slf4j
public class LevelServiceImpl implements LevelService {

    @Autowired
    private LevelMapper levelMapper;

    @Override
    public List<MemberLevelEntity> fetchUserLevelList(BaseEntity baseEntity) {
        return levelMapper.fetchUserLevelList(baseEntity);
    }

    @Override
    public Integer countUserLevels(BaseEntity baseEntity) {
        return levelMapper.countUserLevels(baseEntity);
    }

    @Transactional
    @Override
    public void addLevelInfo(LevelOpeReq levelOpeReq) {
        levelMapper.addLevelInfo(levelOpeReq);
    }

    @Transactional
    @Override
    public void updateLevelInfo(LevelOpeReq levelOpeReq) {
        levelMapper.updateLevelInfo(levelOpeReq);
    }

    @Transactional
    @Override
    public void deleteLevelInfo(Integer id) {
        levelMapper.deleteLevelInfo(id);
    }
}
