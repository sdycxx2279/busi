package com.dingzhang.util;

import java.security.MessageDigest;

/**
 * 进行MD5加密
 * @author Xiao Xu
 * @create 2017-08-06 20:25
 **/

public class MD5Util {
    /* md5 加密 */
    public static String MD5(String str) {
        try {
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(str.getBytes());
            // return getEncode16(digest);
            return getEncode32(digest);
        } catch (Exception e) {
        }
        return null;

    }

    /**
     * 32位加密
     *
     * @param digest
     * @return
     */
    private static String getEncode32(MessageDigest digest) {
        StringBuilder builder = new StringBuilder();
        for (byte b : digest.digest()) {
            builder.append(Integer.toHexString((b >> 4) & 0xf));
            builder.append(Integer.toHexString(b & 0xf));
        }
        return builder.toString();
    }

}
