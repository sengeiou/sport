package com.cn.great.service.impl;

import com.cn.great.mapper.discount.ReceiveMapper;
import com.cn.great.service.ReceiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReceiveServiceImpl implements ReceiveService {

    @Autowired
    private ReceiveMapper receiveMapper;

    @Override
    public boolean receiveBoolean(int userId, String ip, int conditionId) {
        int aBoolean = receiveMapper.receiveBoolean(userId, ip, conditionId);
        if (aBoolean > 0) {
            return true;
        }
        return false;
    }
}
