package com.cn.great.controller;


import com.cn.great.model.common.DictConstant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.system.DictEntity;
import com.cn.great.service.DictService;
import com.cn.great.util.DateUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: sport
 * @description: 用户管理类
 * @author: Stamp.M
 * @create: 2019-03-06 19:20
 **/
@RestController
@RequestMapping("/Maintain")
@Slf4j
public class MaintainController {
    @Autowired
    private DictService dictService;
    @GetMapping("Maintain")
    public ResponseEntity getAllMessage() throws ParseException {
        Map retMap=new HashMap<>();
        log.info("获取所有的维护信息start---by zach");
        List<DictEntity> list=dictService.getAllType(DictConstant.SYSTEM_MAIN_TAIN);
        for(DictEntity dict:list){
            retMap.put(dict.getCode()+"_msg",dict.getValue());
            String[] timeStr=dict.getValue().split("~");
            long start= DateUtils.dateCheckTimeStamp(timeStr[0]);
            long end= DateUtils.dateCheckTimeStamp(timeStr[1]);
            int state=0;
            if(System.currentTimeMillis()/1000>=start&&System.currentTimeMillis()/1000<=end){
                start=1;
            }
            retMap.put(dict.getCode(),state);
        }
        log.info("获取所有的维护信息end---by zach");
        return ResponseEntity.initGeneralResponseObj("查询成功",retMap);
    }
}
