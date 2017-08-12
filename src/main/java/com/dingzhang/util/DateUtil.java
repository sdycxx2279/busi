package com.dingzhang.util;


import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;


/**
 * 提供日期格式验证、日期与字符串之间相互转化功能
 * @author Xiao Xu
 * @create 2017-08-12 10:51
 **/

public class DateUtil {
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    static
    {
        // 设置lenient为false. 否则SimpleDateFormat会比较宽松地验证日期，比如2007/02/29会被接受，并转换成2007/03/01
        dateFormat.setLenient(false);
    }
    public static boolean isValidDate(String s)
    {
        try
        {
            dateFormat.parse(s);
            return true;
        }
        catch (Exception e)
        {
            // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
            return false;
        }
    }

    /**
     * 将date时间格式化成字符串
     * @param date
     * @return
     * @author waiting
     */
    public static String dateTimaFormat(Date date){
        SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");
        String str=sdf.format(date);
        return str;
    }
    /**
     * 将字符串转成Date
     * @param date
     * @return
     */
    public static  Date stringConvertDate(String date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date1=null;
        try {
            date1 = (Date) formatter.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date1;
    }
}
