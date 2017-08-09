package com.dingzhang.util;

/**
 * @author Xiao Xu
 * @create 2017-08-09 23:56
 **/

public class PageUtil {
    public static int getCurrentPage(int currentPage,int allPages,String type){
        if ("previous".equals(type)) {
            if( currentPage > 1 ){//第一页不能往前翻页
                currentPage--;
            }
        } else if ("next".equals(type)) {
            currentPage++;
        } else if ("first".equals(type)) {
            currentPage = 1;
        } else if ("last".equals(type)) {
            currentPage = allPages;
        } else {
            currentPage = Integer.parseInt(type);
        }
        return currentPage;
    }
}
