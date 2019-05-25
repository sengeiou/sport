package com.cn.great.enums;

import org.apache.commons.lang3.StringUtils;

/**
 * @program: sport
 * @description: 在线和离线枚举
 * @author: Stamp
 * @create: 2019-04-03 14:09
 **/
public enum OnlineEnum {

    USER_NOT_ONLINE("0", "登出"),
    USER_ONLINE("1", "登录");

    private String code;
    private String message;

    OnlineEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public static String getCode(String message) {
        for (OnlineEnum c : OnlineEnum.values()) {
            if (StringUtils.equals(c.getMessage(), message)) {
                return c.code;
            }
        }
        return "";
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public final String getCode() {
        return this.code;
    }

    public final String getMessage() {
        return this.message;
    }

}
