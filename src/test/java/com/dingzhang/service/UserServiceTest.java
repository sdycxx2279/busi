package com.dingzhang.service;

import com.dingzhang.BaseTest;
import com.dingzhang.model.User;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-07 16:50
 **/

public class UserServiceTest extends BaseTest {
    @Autowired
    UserService userService;

    @Test
    public void testPage(){
        Page page = PageHelper.startPage(0, 3, "id");

        List<User> userList=userService.getUserList("5555");

//        for(User u:userList){
//            System.out.println(u.toString());
//        }
        System.out.println(page.getPages());
        System.out.println(page.getPageNum());
    }

}
