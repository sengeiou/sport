package com.cn.great.util;

import com.cn.great.model.common.Constant;
import org.apache.tomcat.util.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.SecretKeySpec;

/**
 * @program: sport
 * @description: 前后端数据传输加密工具类
 * @author: Stamp.M
 * @create: 2019-03-19 21:59
 **/
public class AesEncryptUtils {

    //参数分别代表 算法名称/加密模式/数据填充方式
    private static final String ALGORITHMSTR = "AES/ECB/PKCS5Padding";

    /**
     * @Description: 加密
     * @Param: [content]
     * @return: java.lang.String
     * @Author: Stamp.M
     * @Date: 2019/3/21
     */
    public static String encrypt(String content) throws Exception {
        String encryptKey = Constant.SECURITY_KEY;
        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        kgen.init(128);
        Cipher cipher = Cipher.getInstance(ALGORITHMSTR);
        cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(encryptKey.getBytes(), "AES"));
        byte[] b = cipher.doFinal(content.getBytes("utf-8"));
        // 采用base64算法进行转码,避免出现中文乱码
        return Base64.encodeBase64String(b);

    }

    /**
     * @Description: 解密
     * @Param: [encryptStr]
     * @return: java.lang.String
     * @Author: Stamp.M
     * @Date: 2019/3/21
     */
    public static String decrypt(String encryptStr) throws Exception {
        String decryptKey = Constant.SECURITY_KEY;
        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        kgen.init(128);
        Cipher cipher = Cipher.getInstance(ALGORITHMSTR);
        cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(decryptKey.getBytes(), "AES"));
        // 采用base64算法进行转码,避免出现中文乱码
        byte[] encryptBytes = Base64.decodeBase64(encryptStr);
        byte[] decryptBytes = cipher.doFinal(encryptBytes);
        return new String(decryptBytes);
    }


}
