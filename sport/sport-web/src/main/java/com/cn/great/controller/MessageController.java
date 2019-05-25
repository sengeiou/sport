package com.cn.great.controller;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.system.MessageTextEntity;
import com.cn.great.model.user.NoticesEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.message.MessageReq;
import com.cn.great.service.NoticesService;
import com.cn.great.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @program: sport
 * @description: 用户管理类
 * @author: Stamp.M
 * @create: 2019-03-06 19:20
 **/
@RestController
@RequestMapping("/Message")
@Slf4j
public class MessageController {
    @Autowired
    private NoticesService noticesService;

    @Autowired
    private UserService userService;

    @GetMapping("getAllMessage")
    public ResponseEntity getAllMessage() {
        log.info("获取平台所有的公告start---by zach");
        List<NoticesEntity> list = noticesService.listAll(null);
        list.forEach(p -> p.setAlert(null));
        log.info("获取平台所有的公告end---by zach");
        return ResponseEntity.initGeneralResponseObj("查询成功", list);
    }

    @GetMapping("getLoginMessage")
    public ResponseEntity getLoginMessage() {
        log.info("获取登陆的弹框信息start---by zach");
        List<NoticesEntity> list = noticesService.listAll(0);
        list.forEach(p -> {
            p.setId(null);
            p.setAlert(null);
            p.setAddDate(null);
            p.setTitle(null);
        });
        log.info("获取登陆的弹框信息end---by zach");
        return ResponseEntity.initGeneralResponseObj("登陆弹框", list);
    }

    @GetMapping("getPayMessage")
    public ResponseEntity getPayMessage() {
        log.info("获取支付的弹框信息start---by zach");
        List<NoticesEntity> list = noticesService.listAll(1);
        list.forEach(p -> {
            p.setId(null);
            p.setAlert(null);
            p.setAddDate(null);
            p.setTitle(null);
        });
        log.info("获取支付的弹框信息end---by zach");
        return ResponseEntity.initGeneralResponseObj("支付中心弹框", list);
    }

    @GetMapping("Unread")
    public ResponseEntity Unread(HttpServletRequest request) throws GeneralException {
        log.info("站内信-获取未读消息条数start---------------------------by Chris");
        int messageNumber = 0;
        Object userName = request.getSession().getAttribute(Constant.USER_NAME_SESSION);
        UserInfoEntity user = userService.fetchUserInfo(String.valueOf(userName));
        messageNumber = noticesService.getMessageNumber(user.getId());

        log.info("获取未读消息条数end---------------------------by Chris");
        return ResponseEntity.initGeneralResponseObj("站内信-未读消息条数", messageNumber);
    }

    @GetMapping("MessageList")
    public ResponseEntity MessageList(HttpServletRequest request) throws GeneralException {
        log.info("站内信-获取消息列表start---------------------------by Chris");
        List<HashMap<String, String>> messageList;
        Object userName = request.getSession().getAttribute(Constant.USER_NAME_SESSION);
        UserInfoEntity user = userService.fetchUserInfo(String.valueOf(userName));
        messageList = noticesService.getMessageList(user.getId());

        log.info("获取消息列表end---------------------------by Chris");
        return ResponseEntity.initGeneralResponseObj("站内信-所有消息列表", messageList);
    }

    @PostMapping("MessageDetail")
    public ResponseEntity MessageDetail(@RequestParam("id") int id) throws GeneralException {
        log.info("某条消息详情Start---------------------------by Chris");
        HashMap<String, Object> messageInfo = noticesService.getMessageInfo(id);
        HashMap<String, String> messagereplyList = noticesService.getMessagereplyList(id);
        if (null == messageInfo) {
            return ResponseEntity.initGeneralResponseObj("站内信-某 条消息详情", messageInfo);
        }
        messageInfo.put("reply", messagereplyList);

        log.info("某条消息详情end---------------------------by Chris");
        return ResponseEntity.initGeneralResponseObj("站内信-某 条消息详情", messageInfo);
    }

    @PostMapping("MessageDel")
    public ResponseEntity MessageDel(@RequestParam("id") int id) throws GeneralException {
        log.info("删除站内信Start---------------------------by Chris");
        if (noticesService.deleteMessageById(id) == 0) {
            log.info("删除站内信End---------------------------by Chris");
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.DELETE_MESSAGE_FAILURE);
        }
        log.info("删除站内信End---------------------------by Chris");
        return new ResponseEntity("删除成功");
    }

    @PostMapping("MessageReply")
    public ResponseEntity MessageReply(@RequestBody MessageReq messageReq, HttpServletRequest request) throws GeneralException {
        log.info("站内信回复Start---------------------------by Chris");

        String value = String.valueOf(request.getSession().getAttribute(Constant.USER_NAME_SESSION));
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int reply = 0;
        /**
         *  从缓存中获取数据，缓存中没有,则查询数据库
         */
        UserInfoEntity userInfoEntity = userService.fetchUserInfo(value);
        String title = noticesService.selectTitleById(messageReq.getId());
        Date date = new Date();
        /**
         * 封装值新增
         */
        if (StringUtils.isNotEmpty(title)) {
            MessageTextEntity message=new MessageTextEntity();
            message.setFromUser(userInfoEntity.getId());
            message.setTitle(title);
            message.setContext(messageReq.getContext());
            message.setAddDate(sf.format(date));
            message.setToUser(messageReq.getToUser());
            message.setReplyId( messageReq.getId());
            message.setServerAdmin(userInfoEntity.getServerAdmin());
            reply = noticesService.addMessageTextReply(message);
            if (reply > 0) {
                log.info("站内信回复End---------------------------by Chris");
                return new ResponseEntity("回复成功");
            }
        }
        log.info("站内信回复End---------------------------by Chris");
        throw GeneralException.initEnumGeneralException(ResponseCodeEnum.REPLY_MESSAGE_FAILURE);
    }


}
