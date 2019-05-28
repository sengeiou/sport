package com.cn.great.service.impl;

import com.cn.great.mapper.system.LogInfoMapper;
import com.cn.great.req.system.LogOpeReq;
import com.cn.great.service.LogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @program: sportmanage
 * @description: 操作日志serviceImpl
 * @author: Stamp
 * @create: 2019-05-26 17:17
 **/
@Service
@Slf4j
public class LogServiceImpl implements LogService {

    @Resource
    private LogInfoMapper logInfoMapper;

    @Transactional
    @Override
    public void addLogInfo(LogOpeReq logOpeReq) {
        logInfoMapper.addLogInfo(logOpeReq);
    }
}
