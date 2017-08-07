package com.dingzhang.util;

import com.dingzhang.BaseTest;
import com.dingzhang.util.MD5Util;
import org.junit.Test;

/**
 * @author Xiao Xu
 * @create 2017-08-06 20:34
 **/

public class MD5Test extends BaseTest{
    @Test
    public void testAdd() throws Exception {
       System.out.println(MD5Util.MD5("1"));
    }
}
