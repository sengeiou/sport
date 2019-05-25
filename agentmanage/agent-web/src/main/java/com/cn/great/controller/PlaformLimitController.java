package com.cn.great.controller;

import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.game.MemberBkConfig;
import com.cn.great.model.game.MemberFtConfig;
import com.cn.great.req.game.MemberBKConfigReq;
import com.cn.great.req.game.MemberFTConfigReq;
import com.cn.great.service.PlatformLimitService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
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
 * @program: agentmanage
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
     * @Description: 篮球平台限额查询
     * @Param: [request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/16
     */
    @PostMapping(value = "bkConfigs", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity bkConfigs(@RequestBody MemberBKConfigReq memberBKConfigReq, HttpServletRequest request) throws GeneralException {
        List<MemberBkConfig> memberBkConfigs = plaformLimitService.fetchDefaultBKConfigs(memberBKConfigReq.getId());
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
    public ResponseEntity ftConfigs(@RequestBody MemberFTConfigReq memberFTConfigReq, HttpServletRequest request) throws GeneralException {
        List<MemberFtConfig> memberFtConfigs = plaformLimitService.fetchDefaultFTConfigs(memberFTConfigReq.getId());
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

        List<MemberBkConfig> memberBkConfigs = plaformLimitService.fetchDefaultBKConfigs(memberBKConfigReq.getUserid());
        List<MemberBkConfig> bkPlatforms = memberBkConfigs.parallelStream()
                .filter(a -> a.getType() == 0)
                .collect(Collectors.toList());
        if (CollectionUtils.isEmpty(bkPlatforms)) {
            plaformLimitService.addBkPlatformConfig(memberBKConfigReq);
        } else {
            plaformLimitService.updateBkPlatformConfig(memberBKConfigReq);
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

        List<MemberFtConfig> memberFtConfigs = plaformLimitService.fetchDefaultFTConfigs(memberFTConfigReq.getUserid());
        List<MemberFtConfig> ftPlatforms = memberFtConfigs.parallelStream()
                .filter(a -> a.getType() == 0)
                .collect(Collectors.toList());
        if (CollectionUtils.isEmpty(ftPlatforms)) {
            plaformLimitService.addFTPlatformConfig(memberFTConfigReq);
        } else {
            plaformLimitService.updateFTPlatformConfig(memberFTConfigReq);
        }
        return ResponseEntity.initGeneralSuccessResponse();
    }


}
