package com.cn.great.util;

import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import java.security.SecureRandom;


/**
 * AG  DES 解密、加密方法
 * @author Freeman
 * @date   2018-04-1
 * @version 1.0
 */

public class DesEncryptDecrytUtils {

    String key;
    public DesEncryptDecrytUtils() {}

    public DesEncryptDecrytUtils(String key) {this.key = key;}

    /**
     * DES加密算法。
     * @param plainText
     * @return 返回加密后的字节数组。
     * @throws Exception
     */

    public byte[] desEncrypt(byte[] plainText) throws Exception {
        SecureRandom sr = new SecureRandom();
        DESKeySpec dks = new DESKeySpec(key.getBytes());
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey key = keyFactory.generateSecret(dks);
        Cipher cipher = Cipher.getInstance("DES");
        cipher.init(Cipher.ENCRYPT_MODE, key, sr);
        byte encryptedData[] = cipher.doFinal(plainText);
        return encryptedData;

    }

    /**
     * DES解密算法。
     * @param encryptText
     * @return 返回解密后字节数组。
     * @throws Exception
     */

    public byte[] desDecrypt(byte[] encryptText) throws Exception {

        SecureRandom sr = new SecureRandom();
        DESKeySpec dks = new DESKeySpec(key.getBytes());
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey key = keyFactory.generateSecret(dks);
        Cipher cipher = Cipher.getInstance("DES");
        cipher.init(Cipher.DECRYPT_MODE, key, sr);
        byte encryptedData[] = cipher.doFinal(encryptText);
        return encryptedData;
    }

    public String encrypt(String input){
        try {
            return base64Encode(desEncrypt(input.getBytes()))
                    .replaceAll("\\s*", "");
        } catch (Exception e) {

        }
        return null;
    }

    public String decrypt(String input) throws Exception {
        byte[] result = base64Decode(input);
        return new String(desDecrypt(result));
    }
    public String base64Encode(byte[] s) {
        if (s == null) {
            return null;
        }
        return Base64.encodeBase64String(s);
    }

    public byte[] base64Decode(String s){

        if (s == null)return null;
        try {
            return Base64.decodeBase64(s);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getKey() { return key; }

    public void setKey(String key) {this.key = key;}
}
