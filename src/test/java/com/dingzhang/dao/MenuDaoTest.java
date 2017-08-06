package com.dingzhang.dao;

import com.dingzhang.BaseTest;
import com.dingzhang.model.Menu;
import com.dingzhang.model.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-06 22:37
 **/

public class MenuDaoTest extends BaseTest {
    @Autowired
    MenuDao menuMapper;

    @Test
    public void testSelect() throws Exception {
       List<Menu> menus = menuMapper.selectByParent_id(1);
        for(Menu menu : menus) {
            System.out.println(menu.toString());
        }
    }
}
