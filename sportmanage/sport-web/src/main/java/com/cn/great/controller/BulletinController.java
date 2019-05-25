package com.cn.great.controller;


import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.system.MessageTextEntity;
import com.cn.great.model.user.NoticesEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.bulletin.MessageReq;
import com.cn.great.req.bulletin.NoticesReq;
import com.cn.great.service.MessageService;
import com.cn.great.service.NoticesService;
import com.cn.great.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: sport
 * @description: 用户管理类
 * @author: Stamp.M
 * @create: 2019-03-06 19:20
 **/
@Controller
@RequestMapping("bulletin")
@Slf4j
public class BulletinController {

    @Resource
    private NoticesService noticesService;
    @Resource
    private MessageService messageService;
    @Resource
    private UserService userService;

    /**
     * @Description: 管理员列表跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("noticesPage")
    public String noticesPage() {
        return "bulletin/noticesinfo";
    }
    @RequestMapping("messagePage")
    public String messagePage() {
        return "bulletin/messageinfo";
    }
    /**
     *
     * @param noticesReq
     * @return
     * @throws GeneralException
     */
    @PostMapping(value = "noticesList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity noticesList(@RequestBody NoticesReq noticesReq) throws Exception {
        List<NoticesEntity> notices = noticesService.fetchList(noticesReq);
        Integer recordsTotal = noticesService.count(noticesReq);
        return ResponseEntity.initGeneralResponseRes(notices, recordsTotal);
    }
    /**
     *
     * @param id
     * @return
     * @throws GeneralException
     */
    @PostMapping("deleteNotices/{id}")
    @ResponseBody
    public ResponseEntity delete(@PathVariable("id") Integer id) throws Exception {
        noticesService.delete(id);
        return ResponseEntity.initGeneralSuccessResponse();
    }
    /**
     *新增
     * @param noticesEntity
     * @return
     * @throws GeneralException
     */
    @PostMapping(value="addNotices", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity add(@RequestBody NoticesEntity noticesEntity) throws Exception {
        noticesService.save(noticesEntity);
        return ResponseEntity.initGeneralSuccessResponse();
    }
    /**
     *新增
     * @param noticesEntity
     * @return
     * @throws GeneralException
     */
    @PostMapping(value="updateNotices", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity update(@RequestBody NoticesEntity noticesEntity) throws Exception {
        noticesService.update(noticesEntity);
        return ResponseEntity.initGeneralSuccessResponse();
    }
    /**
     *
     * @param messageReq
     * @return
     * @throws GeneralException
     */
    @PostMapping(value = "messageList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity messageList(@RequestBody MessageReq messageReq) throws Exception {
        if(StringUtils.isNotBlank(messageReq.getFromUser())){
            UserInfoEntity userInfoEntity=userService.fetchUserInfo(messageReq.getFromUser());
            messageReq.setFromUserId(userInfoEntity.getId());
        }
        List<MessageTextEntity> list = messageService.fetchList(messageReq);
        Integer recordsTotal = messageService.count(messageReq);
        return ResponseEntity.initGeneralResponseRes(list, recordsTotal);
    }
    /**
     *
     * @param id
     * @return
     * @throws GeneralException
     */
    @PostMapping("deleteMessage/{id}")
    @ResponseBody
    public ResponseEntity deleteMessage(@PathVariable("id") Integer id) throws Exception {
        messageService.delete(id);
        return ResponseEntity.initGeneralSuccessResponse();
    }
    /**
     *
     * @param id
     * @return
     * @throws GeneralException
     */
    @PostMapping("viewMessage/{id}")
    @ResponseBody
    public ResponseEntity viewMessage(@PathVariable("id") Integer id) throws Exception {
        MessageTextEntity textEntity=messageService.view(id);
        return ResponseEntity.initGeneralResponseObj("",textEntity);
    }
}
