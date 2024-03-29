package com.cn.great.util;

import com.cn.great.model.common.Constant;

import java.security.MessageDigest;

/**
 * @program: sport
 * @description: 常规MD5加密
 * @author: Stamp.M
 * @create: 2019-03-21 10:42
 **/
public class MD5Utils {

    //十六进制下数字到字符的映射数组
    private final static String[] hexDigits = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"};

    /**
     * @Description: 对字符串进行MD5编码
     * @Param: [originString]
     * @return: java.lang.String
     * @Author: Stamp.M
     * @Date: 2019/3/21
     */
    public static String encodeByMD5(String originString) {
        if (originString != null) {
            originString += Constant.PASSWORD_MD5_SALT;
            try {
                //创建具有指定算法名称的信息摘要
                MessageDigest md5 = MessageDigest.getInstance("MD5");
                //使用指定的字节数组对摘要进行最后更新，然后完成摘要计算
                byte[] results = md5.digest(originString.getBytes());
                //将得到的字节数组变成字符串返回
                String result = byteArrayToHexString(results);
                return result;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * @Description: 轮换字节数组为十六进制字符串
     * @Param: [b]
     * @return: java.lang.String
     * @Author: Stamp.M
     * @Date: 2019/3/21
     */
    private static String byteArrayToHexString(byte[] b) {
        StringBuffer resultSb = new StringBuffer();
        for (int i = 0; i < b.length; i++) {
            resultSb.append(byteToHexString(b[i]));
        }
        return resultSb.toString();
    }

    /**
     * @Description: 将一个字节转化成十六进制形式的字符串
     * @Param: [b]
     * @return: java.lang.String
     * @Author: Stamp.M
     * @Date: 2019/3/21
     */
    private static String byteToHexString(byte b) {
        int n = b;
        if (n < 0)
            n = 256 + n;
        int d1 = n / 16;
        int d2 = n % 16;
        return hexDigits[d1] + hexDigits[d2];
    }


}
