package com.cn.great.util;

import com.cn.great.annotations.ParamCheck;
import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Field;
import java.util.Optional;

/**
 * @program: sport
 * @description: 一般常用工具类
 * @author: Stamp.M
 * @create: 2019-03-21 14:01
 **/
public class GeneralUtils {
    private static Logger logger = LoggerFactory.getLogger(GeneralUtils.class);


    /**
     * @Description: 参数必填校验
     * @Param: [obj]
     * @return: boolean
     * @Author: Stamp.M
     * @Date: 2019/3/21
     */
    public static void checkParams(Object obj) throws GeneralException {
        Class clz = obj.getClass();
        Field[] fields = clz.getDeclaredFields();
        for (Field field : fields) {
            if (field.isAnnotationPresent(ParamCheck.class)) {
                ParamCheck paramCheck = field.getAnnotation(ParamCheck.class);
                if (paramCheck.isNeed()) {
                    field.setAccessible(true);
                    try {
                        Object val = field.get(obj);
                        if (val == null)
                            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.PARAMETER_CHECK_ERROR);
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                        throw GeneralException.initEnumGeneralException(ResponseCodeEnum.PARAMETER_CHECK_ERROR);
                    }
                }
            }
        }
    }

    /**
     * @Description: 对响应的对象加密处理
     * @Param: [obj]
     * @return: java.lang.String
     * @Author: Stamp.M
     * @Date: 2019/3/22
     */
    public static String encryptRes(Object obj) {
        ObjectMapper objectMapper = new ObjectMapper();
        String result = "";
        try {
            String json = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(obj);
            logger.info("<<<响应数据>>>加密前：{}", json);
            result = AesEncryptUtils.encrypt(json);
            logger.info("<<<响应数据>>>加密后：{}", result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * @Description: 获取String类型的值
     * @Param: [obj]
     * @return: java.lang.String
     * @Author: Stamp.M
     * @Date: 2019/3/28
     */
    public static String getStringValue(Object obj) {
        String res = Optional.ofNullable(obj)
                .map(a -> String.valueOf(a))
                .orElse("");
        return res;
    }

}
