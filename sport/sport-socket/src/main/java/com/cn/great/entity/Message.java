package com.cn.great.entity;

import com.alibaba.fastjson.JSONObject;
import lombok.Data;

@Data
public class Message {
    private String event;
    private JSONObject params;

}
