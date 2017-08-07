package com.dingzhang.service;

import com.dingzhang.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author Xiao Xu
 * @create 2017-08-07 15:57
 **/

public class MenuServiceTest extends BaseTest {
    @Autowired
    MenuService menuService;

    @Test
    public void testGet() throws Exception{
        System.out.println(0);
        menuService.printList(menuService.getDisplayMenu(0));
        System.out.println(1);
        menuService.printList(menuService.getDisplayMenu(1));
        System.out.println(2);
        menuService.printList(menuService.getDisplayMenu(2));
    }
}
