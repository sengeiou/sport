package com.cn.great.config;


import com.cn.great.util.JacksonUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * @Description: i18n util
 * @Author: Stamp
 * @Date: 2019/4/7
 */
public class I18nUtil {
    private static Logger logger = LoggerFactory.getLogger(I18nUtil.class);
    private static Properties prop = null;

    public static Properties loadI18nProp() {
        if (prop != null) {
            return prop;
        }
        try {
            String i18n = AdminConfig.getAdminConfig().getI18n();
            i18n = StringUtils.isNotBlank(i18n) ? ("_" + i18n) : i18n;
            String i18nFile = MessageFormat.format("i18n/message{0}.properties", i18n);
            Resource resource = new ClassPathResource(i18nFile);
            EncodedResource encodedResource = new EncodedResource(resource, "UTF-8");
            prop = PropertiesLoaderUtils.loadProperties(encodedResource);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return prop;
    }

    /**
     * @Description: get val of i18n key
     * @Param: [key]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/7
     */
    public static String getString(String key) {
        return loadI18nProp().getProperty(key);
    }

    /**
     * @Description: get mult val of i18n mult key, as json
     * @Param: [keys]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/7
     */
    public static String getMultString(String... keys) {
        Map<String, String> map = new HashMap<String, String>();
        Properties prop = loadI18nProp();
        if (keys != null && keys.length > 0) {
            for (String key : keys) {
                map.put(key, prop.getProperty(key));
            }
        } else {
            for (String key : prop.stringPropertyNames()) {
                map.put(key, prop.getProperty(key));
            }
        }
        String json = JacksonUtil.writeValueAsString(map);
        return json;
    }

}
