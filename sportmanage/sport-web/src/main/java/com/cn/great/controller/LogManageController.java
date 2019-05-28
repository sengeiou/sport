package com.cn.great.controller;

import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.system.LogInfo;
import com.cn.great.req.system.LogReq;
import com.cn.great.service.LogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @program: sportmanage
 * @description: 日志管理
 * @author: Stamp
 * @create: 2019-05-26 16:38
 **/
@Controller
@RequestMapping("log")
@Slf4j
public class LogManageController {

    @Resource
    private LogService logService;
    
    /** 
    * @Description: 日志查询页面跳转
    * @Param: [model, request] 
    * @return: java.lang.String 
    * @Author: Stamp 
    * @Date: 2019/5/26 
    */
    @RequestMapping("logPage")
    public String logPage(Model model, HttpServletRequest request) {
        return "system/loginfo";
    }

    /** 
    * @Description: 操作日志查询
    * @Param: [logReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/5/26 
    */
    @PostMapping(value = "logList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity logList(@RequestBody LogReq logReq, HttpServletRequest request) throws GeneralException {

        List<LogInfo> logs = logService.fetchLogs(logReq);
        Integer recordsTotal = logService.countLogs(logReq);
        return ResponseEntity.initGeneralResponseRes(logs, recordsTotal);
    }
}
