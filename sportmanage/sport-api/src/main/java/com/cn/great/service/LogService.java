package com.cn.great.service;

import com.cn.great.model.system.LogInfo;
import com.cn.great.req.system.LogOpeReq;
import com.cn.great.req.system.LogReq;

import java.util.List;

/**
 * @program: sportmanage
 * @description: 操作日志service
 * @author: Stamp
 * @create: 2019-05-26 17:14
 **/
public interface LogService {

    /**
     * @Description: 操作日志查询
     * @Param: [logReq]
     * @return: java.util.List<com.cn.great.model.system.LogInfo>
     * @Author: Stamp
     * @Date: 2019/5/26
     */
    List<LogInfo> fetchLogs(LogReq logReq);

    /**
     * @Description: 日志数查询
     * @Param: [logReq]
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/5/26
     */
    Integer countLogs(LogReq logReq);

    /**
     * @Description: 记录操作日志
     * @Param: [logInfo]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/26
     */
    void addLogInfo(LogOpeReq logOpeReq);
}
