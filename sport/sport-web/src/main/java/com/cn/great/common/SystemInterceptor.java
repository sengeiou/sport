package com.cn.great.common;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.DictConstant;
import com.cn.great.model.system.DictEntity;
import com.cn.great.service.DictService;
import com.cn.great.util.DateUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;

/**
 * @program: sport
 * @description: 系统设置过滤器
 * @author: zach.M
 * @create: 2019-03-19 21:42
 **/
@Slf4j
@Component
public class SystemInterceptor implements HandlerInterceptor {
    @Autowired
    private DictService dictService;


    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object object) {
        //获取系统设置全站维护信息
        DictEntity timeObj = dictService.getByCode(DictConstant.ALL_WEB);
        if(timeObj!=null){
            String timeStr=timeObj.getValue();
            if(StringUtils.isNotBlank(timeStr)){
                String[] times=timeStr.split("~");
                try {
                    long start= DateUtils.dateCheckTimeStamp(StringUtils.trim(times[0]));
                    long end= DateUtils.dateCheckTimeStamp(StringUtils.trim(times[1]));
                    //如果当前是系统维护时间
                    if(System.currentTimeMillis()/1000>=start&&System.currentTimeMillis()/1000<=end){
                        log.error("全站维护，维护时间为{}到{}",StringUtils.trim(times[0]),StringUtils.trim(times[1]));
                        throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TOTAL_STATION_MAINTENANCE);
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
        }
        return true;
    }

}
