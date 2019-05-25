package com.cn.great.service;

/**
 * 领取红包记录业务
 */
public interface ReceiveService {

    boolean receiveBoolean(int userId,String ip,int conditionId);
    
}
