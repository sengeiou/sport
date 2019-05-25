package com.cn.great.util;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: sport
 * @description: IP工具
 * @author: Stamp.M
 * @create: 2019-03-20 19:17
 **/
public class IPUtils {

    /**
     * @Description: 获取Request的IP地址（全IP地址）
     * @Param: [request, isFull]
     * @return: java.lang.String
     * @Author: Stamp.M
     * @Date: 2019/3/21
     */
    public static String getRealIp(HttpServletRequest request, int isFull) {
        // 这个一般是Nginx反向代理设置的参数
        String ip = request.getHeader("X-Real-IP");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-For");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if (isFull == 0 && ip != null && ip.contains(",")) {
            String[] ipArray = ip.split(",");
            ip = ipArray[0];
        }
        return ip;
    }

}
