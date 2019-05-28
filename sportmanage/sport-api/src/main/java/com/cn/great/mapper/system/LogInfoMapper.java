package com.cn.great.mapper.system;

import com.cn.great.model.system.LogInfo;
import com.cn.great.req.system.LogOpeReq;
import com.cn.great.req.system.LogReq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: sportmanage
 * @description: 操作日志Mapper
 * @author: Stamp
 * @create: 2019-05-26 17:16
 **/
@Mapper
public interface LogInfoMapper {

    List<LogInfo> fetchLogs(LogReq logReq);

    Integer countLogs(LogReq logReq);

    void addLogInfo(LogOpeReq logOpeReq);
}
