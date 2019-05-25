package com.cn.great.config;


import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.annotation.Configuration;


/**
* @Description: 配置文件读取
* @Author: Stamp
* @Date: 2019/4/10
*/
@Configuration
public class AdminConfig implements InitializingBean {
    private static AdminConfig adminConfig = null;
    public static AdminConfig getAdminConfig() {
        return adminConfig;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        adminConfig = this;
    }

    private String i18n = "";

    public String getI18n() {
        return i18n;
    }

}
