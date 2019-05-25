package com.cn.great.util;

import java.util.Random;

/**
 * 订单号生成规则
 * @author Freeman
 * @date   2018-04-1
 * @version 1.0
 */


public class IdGenerator {

    public static String getNumberString(int length,String code) { //length表示生成字符串的长度
        String base = "0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return code+sb.toString();
    }
}
