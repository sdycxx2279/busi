package com.dingzhang.service;

import com.dingzhang.model.MenuModel;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-07 15:36
 **/

public interface MenuService {
    /**
     * 获取显示菜单
     * @param status
     * @return
     */
    List<MenuModel> getDisplayMenu(int status);


    /**
     * 获取子菜单
     * @param parentId
     * @param status
     * @return
     */
    List<MenuModel> getSubMenu(int parentId,int status);

    /**
     * 打印以检验Service
     * @param menuList
     */
    void printList(List<MenuModel> menuList);
}
