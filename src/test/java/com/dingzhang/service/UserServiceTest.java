package com.dingzhang.service;

import com.dingzhang.BaseTest;
import com.dingzhang.model.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author Xiao Xu
 * @create 2017-08-07 16:50
 **/

public class UserServiceTest extends BaseTest {
    @Autowired
    UserService userService;

    @Test
    public void testLogin(){
        User user = userService.login("111","1");
        System.out.println(user);
    }

}
