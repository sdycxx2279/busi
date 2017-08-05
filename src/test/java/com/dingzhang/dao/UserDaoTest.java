package com.dingzhang.dao;

import com.dingzhang.BaseTest;
import com.dingzhang.model.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 测试UserDao函数功能
 * @author Xiao Xu
 * @create 2017-08-03 16:37
 **/

public class UserDaoTest extends BaseTest {
    @Autowired
    private UserDao userDao;

    @Test
    public void testAdd() throws Exception {
        User user = new User("111","123456","徐龙杰",true);
        int a = userDao.addUser(user);
        System.out.println(a);
    }

    @Test
    public void testSelect() throws Exception {
        User user = userDao.selectByName("111");
        System.out.println(user.toString());
    }
}
