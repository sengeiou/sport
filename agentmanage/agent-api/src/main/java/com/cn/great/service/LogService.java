package com.cn.great.service;

import com.cn.great.req.system.LogOpeReq;

/**
 * @program: sportmanage
 * @description: 操作日志service
 * @author: Stamp
 * @create: 2019-05-26 17:14
 **/
public interface LogService {

    void addLogInfo(LogOpeReq logOpeReq);
}
