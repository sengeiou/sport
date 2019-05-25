package com.cn.great.controller;

import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.game.MemberBkConfig;
import com.cn.great.model.game.MemberBkDeConfig;
import com.cn.great.model.game.MemberFtConfig;
import com.cn.great.model.game.MemberFtDeConfig;
import com.cn.great.req.game.MemberBKConfigReq;
import com.cn.great.req.game.MemberFTConfigReq;
import com.cn.great.service.PlatformLimitService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @program: sportmanage
 * @description: 平台限额
 * @author: Stamp
 * @create: 2019-05-16 15:58
 **/
@Controller
@RequestMapping("limit")
@Slf4j
public class PlaformLimitController {

    @Resource
    private PlatformLimitService plaformLimitService;

    /**
     * @Description: 平台限制页面跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/16
     */
    @RequestMapping("platformPage")
    public String platformPage(Model model, HttpServletRequest request) {
        return "game/platformlimit";
    }


    /**
     * @Description: 篮球平台限额查询
     * @Param: [request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/16
     */
    @PostMapping(value = "bkConfigs", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity bkConfigs(HttpServletRequest request) throws GeneralException {
        List<MemberBkConfig> memberBkConfigs = plaformLimitService.fetchDefaultBKConfigs();
        return ResponseEntity.initGeneralResponseRes(memberBkConfigs, memberBkConfigs.size());
    }


    /**
     * @Description: 足球平台限额
     * @Param: [request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/16
     */
    @PostMapping(value = "ftConfigs", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity ftConfigs(HttpServletRequest request) throws GeneralException {
        List<MemberFtConfig> memberFtConfigs = plaformLimitService.fetchDefaultFTConfigs();
        return ResponseEntity.initGeneralResponseRes(memberFtConfigs, memberFtConfigs.size());
    }


    /**
     * @Description: 篮球平台限制设置
     * @Param: [memberBKConfigReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    @PostMapping(value = "/opeBKConfig", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity opeBKConfig(@RequestBody MemberBKConfigReq memberBKConfigReq, HttpServletRequest request) throws GeneralException {

        MemberBkConfig memberBkConfig = generalBKConfigPlate(memberBKConfigReq);
        MemberBkDeConfig memberBkDeConfig = generalBKDeConfigPlate(memberBKConfigReq);
        List<MemberBkConfig> memberBkConfigs = plaformLimitService.fetchDefaultBKConfigs();
        List<MemberBkConfig> bkPlatforms = memberBkConfigs.parallelStream()
                .filter(a-> a.getType() == 1 && StringUtils.equals(a.getServerAdmin(), "1"))
                .collect(Collectors.toList());
        List<MemberBkConfig> bkDefaults = memberBkConfigs.parallelStream()
                .filter(a-> a.getType() == 1 && StringUtils.equals(a.getServerAdmin(), "2"))
                .collect(Collectors.toList());
        if(CollectionUtils.isEmpty(bkPlatforms)){
            plaformLimitService.addBkPlatformConfig(memberBkConfig);
        }else{
            plaformLimitService.updateBkPlatformConfig(memberBkConfig);
        }
        if(CollectionUtils.isEmpty(bkDefaults)){
            plaformLimitService.addBkDePlatformConfig(memberBkDeConfig);
        }else{
            plaformLimitService.updateBkDeConfig(memberBkDeConfig);
        }
        return ResponseEntity.initGeneralSuccessResponse();
    }


    /**
    * @Description: 足球平台限额
    * @Param: [memberFTConfigReq, request]
    * @return: com.cn.great.model.common.ResponseEntity
    * @Author: Stamp
    * @Date: 2019/5/17
    */
    @PostMapping(value = "/opeFTConfig", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity opeFTConfig(@RequestBody MemberFTConfigReq memberFTConfigReq, HttpServletRequest request) throws GeneralException {

        MemberFtConfig memberFtConfig = generalFTConfigPlate(memberFTConfigReq);
        MemberFtDeConfig memberFtDeConfig = generalFTDeConfigPlate(memberFTConfigReq);
        List<MemberFtConfig> memberFtConfigs = plaformLimitService.fetchDefaultFTConfigs();
        List<MemberFtConfig> ftPlatforms = memberFtConfigs.parallelStream()
                .filter(a-> a.getType() == 1 && StringUtils.equals(a.getServerAdmin(), "1"))
                .collect(Collectors.toList());
        List<MemberFtConfig> ftDefaults = memberFtConfigs.parallelStream()
                .filter(a-> a.getType() == 1 && StringUtils.equals(a.getServerAdmin(), "2"))
                .collect(Collectors.toList());
        if(CollectionUtils.isEmpty(ftPlatforms)){
            plaformLimitService.addFTPlatformConfig(memberFtConfig);
        }else{
            plaformLimitService.updateFTPlatformConfig(memberFtConfig);
        }
        if(CollectionUtils.isEmpty(ftDefaults)){
            plaformLimitService.addFTDePlatformConfig(memberFtDeConfig);
        }else{
            plaformLimitService.updateFTDeConfig(memberFtDeConfig);
        }
        return ResponseEntity.initGeneralSuccessResponse();
    }





    private MemberBkConfig generalBKConfigPlate(MemberBKConfigReq memberBKConfigReq) {
        MemberBkConfig memberBKConfig = new MemberBkConfig();
        BeanUtils.copyProperties(memberBKConfigReq, memberBKConfig);
        memberBKConfig.setUserid(0);
        memberBKConfig.setType(1);
        //篮球平台限额
        memberBKConfig.setServerAdmin("1");
        return memberBKConfig;
    }

    private MemberBkDeConfig generalBKDeConfigPlate(MemberBKConfigReq memberBKConfigReq) {
        MemberBkDeConfig memberBkDeConfig = new MemberBkDeConfig();
        BeanUtils.copyProperties(memberBKConfigReq, memberBkDeConfig);
        memberBkDeConfig.setUserid(0);
        memberBkDeConfig.setType(1);
        //篮球默认限额
        memberBkDeConfig.setServerAdmin("2");
        return memberBkDeConfig;
    }


    private MemberFtConfig generalFTConfigPlate(MemberFTConfigReq memberFTConfigReq) {
        MemberFtConfig memberFtConfig = new MemberFtConfig();
        BeanUtils.copyProperties(memberFTConfigReq, memberFtConfig);
        memberFtConfig.setUserid(0);
        memberFtConfig.setType(1);
        //足球平台限额
        memberFtConfig.setServerAdmin("1");
        return memberFtConfig;
    }

    private MemberFtDeConfig generalFTDeConfigPlate(MemberFTConfigReq memberFTConfigReq) {
        MemberFtDeConfig memberFtDeConfig= new MemberFtDeConfig();
        BeanUtils.copyProperties(memberFTConfigReq, memberFtDeConfig);
        memberFtDeConfig.setUserid(0);
        memberFtDeConfig.setType(1);
        //足球默认限额
        memberFtDeConfig.setServerAdmin("2");
        return memberFtDeConfig;
    }

}
