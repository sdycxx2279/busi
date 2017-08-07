package com.dingzhang.service.impl;

import com.dingzhang.dao.MenuDao;
import com.dingzhang.model.Menu;
import com.dingzhang.model.MenuModel;
import com.dingzhang.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-07 15:37
 **/
@Service
public class MenuServiceImpl implements MenuService{
    @Autowired
    MenuDao menuMapper;

    @Override
    public List<MenuModel> getDisplayMenu(int status) {
        List<MenuModel> menuList=null;
        int parent_id=0;
        menuList=this.getSubMenu(parent_id,status);//得到一级菜单
        List<MenuModel> subMenuList=null;
        for (MenuModel object:menuList) {
            parent_id=object.getId();
            subMenuList=this.getSubMenu(parent_id,status);
            object.setSubMenus(subMenuList);
        }
        return menuList;
    }

    @Override
    public List<MenuModel> getSubMenu(int parent_id,int status) {
        List<Menu> menuList=menuMapper.selectByParent_idAndStatus(parent_id,status);
        List<MenuModel> returnMenuModel=new ArrayList<MenuModel>();
        for(Menu object:menuList){
            MenuModel menuModel=new MenuModel();
            menuModel.setId(object.getId());
            menuModel.setParent_id(object.getParent_id());
            menuModel.setController(object.getController());
            menuModel.setMethod(object.getMethod());
            menuModel.setName(object.getName());
            returnMenuModel.add(menuModel);
        }
        return returnMenuModel;
    }
    /**
     * 输出list
     */
    public void printList(List<MenuModel> menuList){
        for (MenuModel object:menuList)
        {
//            System.out.println("------------------------");
//            System.out.println("id->"+object.getId());
//            System.out.println("Parent_id->"+object.getParent_id());
//            System.out.println("Controller->"+object.getController());
//            System.out.println("Method->"+object.getMethod());
            System.out.println("Name->"+object.getName());
            if(object.getSubMenus()!=null){
                this.printList(object.getSubMenus());
            }
        }
    }
}
