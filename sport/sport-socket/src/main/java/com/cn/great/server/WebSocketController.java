package com.cn.great.server;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.cn.great.entity.Message;
import com.cn.great.model.common.ResponseEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.*;

@Slf4j
@RestController
public class WebSocketController implements WebSocketHandler {

    private static AtomicInteger onlineCount = new AtomicInteger(0);

    private static final Map<String,WebSocketSession> sessions = new ConcurrentHashMap<>();



    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String userName=session.getAttributes().get("userName").toString();
        sessions.put(userName,session);
        int onlineNum = addOnlineCount();
        log.info("Oprn a WebSocket. Current connection number: " + onlineNum);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        int onlineNum = subOnlineCount();
        log.info("Close a webSocket. Current connection number: " + onlineNum);
        String userName=session.getAttributes().get("userName").toString();
        sessions.remove(userName);
    }

    @Override
    public void handleMessage(WebSocketSession wsSession, WebSocketMessage<?> message) throws Exception {
        log.info("Receive a message from client: " + message.toString());
        Message messages=JSON.parseObject(message.getPayload().toString(), new TypeReference<Message>(){});
        ResponseEntity responseEntity= eventHandler(messages);
        TextMessage textMessage=new TextMessage(JSONObject.toJSONString(responseEntity));
        wsSession.sendMessage(textMessage);
    }

    private ResponseEntity eventHandler(Message messages) {
        switch (messages.getEvent()){
            case "PING":        return ResponseEntity.initGeneralResponseMsg("成功连接中");
            case "sportIndex": return queryOdds(messages.getParams());
        }
        return ResponseEntity.initGeneralResponseMsg("webSocket不支持此事件，请参照文档。");
    }

    private ResponseEntity queryOdds(JSONObject params) {
        return ResponseEntity.initGeneralResponseMsg("查询赔率待处理中。。。");
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        log.error("Exception occurs on webSocket connection. disconnecting....");
        String userName=session.getAttributes().get("userName").toString();
        if (session.isOpen()) {
            session.close();
        }
        sessions.remove(userName);
        subOnlineCount();
    }

    /*
     * 是否支持消息拆分发送：如果接收的数据量比较大，最好打开(true), 否则可能会导致接收失败。
     * 如果出现WebSocket连接接收一次数据后就自动断开，应检查是否是这里的问题。
     */
    @Override
    public boolean supportsPartialMessages() {
        return true;
    }


    public static int getOnlineCount() {
        return onlineCount.get();
    }

    public static int addOnlineCount() {
        return onlineCount.incrementAndGet();
    }

    public static int subOnlineCount() {
        return onlineCount.decrementAndGet();
    }

    /**
     * 推送数据的方法
     * @param userName
     * @param type
     * @throws IOException
     */
    public static void pushData(String userName,String type, Object data) throws IOException {
        Map<String,Object> ret=new HashMap<>();
        ret.put("type",type);
        ret.put("data",data);
        TextMessage tm=new TextMessage(JSONObject.toJSONString(ret));
        WebSocketSession session=sessions.get(userName);
        if(session!=null){
             session.sendMessage(tm);
        }else{
            log.error(userName+"的webSocket 连接不存在");
        }

    }

    /**
     * 批量推送数据
     * @param type
     * @param data
     * @throws IOException
     */
    public static void pushData(String type,Map<String,Object> data) throws IOException {
       for(String userName:data.keySet()){
           pushData(userName,type,data.get(userName));
       }
    }

    /**(
     * 推送金额的方法
     * @param userName
     * @param amount
     * @throws IOException
     */
    public static void pushAmount(String userName, Object amount) throws IOException {
        pushData(userName,"1",amount);
    }


}