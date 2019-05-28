package com.cn.great.mapper.system;

import com.cn.great.req.system.LogOpeReq;
import org.apache.ibatis.annotations.Mapper;

/**
 * @program: sportmanage
 * @description: 操作日志Mapper
 * @author: Stamp
 * @create: 2019-05-26 17:16
 **/
@Mapper
public interface LogInfoMapper {

    void addLogInfo(LogOpeReq logOpeReq);
}
