package com.dingzhang.entity;

import com.dingzhang.model.Menu;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-06 20:57
 **/

public class MenuModel extends Menu {

    List<MenuModel> subMenus;

    public List<MenuModel> getSubMenus() {
        return subMenus;
    }

    public void setSubMenus(List<MenuModel> subMenus) {
        this.subMenus = subMenus;
    }
}

