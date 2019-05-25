package com.cn.great.controller;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.BaseEntity;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.user.MemberLevelEntity;
import com.cn.great.req.user.LevelOpeReq;
import com.cn.great.service.LevelService;
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
 * @program: sport
 * @description: 会员等级类
 * @author: Stamp.M
 * @create: 2019-03-06 19:20
 **/
@Controller
@RequestMapping("level")
@Slf4j
public class LevelController {

    @Resource
    private LevelService levelService;


    /**
     * @Description: 会员等级页面跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("levelPage")
    public String levelPage(Model model, HttpServletRequest request) {
        return "user/userlevel";
    }

    /**
     * @Description: 会员等级列表查询
     * @Param: [baseEntity, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    @PostMapping(value = "levelList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity agentList(@RequestBody BaseEntity baseEntity, HttpServletRequest request) throws GeneralException {
        List<MemberLevelEntity> levels = levelService.fetchUserLevelList(baseEntity);
        Integer recordsTotal = levelService.countUserLevels(baseEntity);
        return ResponseEntity.initGeneralResponseRes(levels, recordsTotal);
    }


    /**
     * @Description: 新增会员等级
     * @Param: [levelOpeReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    @PostMapping(value = "add", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity add(@RequestBody LevelOpeReq levelOpeReq, HttpServletRequest request) throws GeneralException {
        levelService.addLevelInfo(levelOpeReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
     * @Description: 修改会员等级
     * @Param: [levelOpeReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    @PostMapping(value = "/update", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity update(@RequestBody LevelOpeReq levelOpeReq, HttpServletRequest request) throws GeneralException {
        levelService.updateLevelInfo(levelOpeReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
     * @Description: 物理删除会员等级
     * @Param: [baseEntity, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    @PostMapping(value = "remove", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity remove(@RequestBody BaseEntity baseEntity, HttpServletRequest request) throws GeneralException {
        if (baseEntity.getId() == null)
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.FIELD_NOT_STANDARD_ERROR);
        levelService.deleteLevelInfo(baseEntity.getId());
        return ResponseEntity.initGeneralSuccessResponse();
    }


}
