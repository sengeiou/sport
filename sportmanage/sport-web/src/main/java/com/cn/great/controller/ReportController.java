package com.cn.great.controller;

import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.BaseEntity;
import com.cn.great.model.common.ResponseEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: sportmanage
 * @description: 报表管理
 * @author: Stamp
 * @create: 2019-05-28 15:17
 **/
@Controller
@RequestMapping("report")
@Slf4j
public class ReportController {


    /** 
    * @Description: 数据报表页面跳转
    * @Param: [model, request] 
    * @return: java.lang.String 
    * @Author: Stamp 
    * @Date: 2019/5/28 
    */
    @RequestMapping("indexPage")
    public String userPage(Model model, HttpServletRequest request) {
        return "index";
    }
    
    /** 
    * @Description: 初始化报表 
    * @Param: [baseEntity, request]
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/5/28 
    */
    @PostMapping(value = "initChart", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity initChart(@RequestBody BaseEntity baseEntity, HttpServletRequest request) throws GeneralException {
        // 打码量和平台亏盈统计

        //会员变化统计

        //出入款金额统计

        return ResponseEntity.initGeneralSuccessResponse();
    }

}
