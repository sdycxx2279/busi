package com.dingzhang.controller;

import com.dingzhang.entity.MenuModel;
import com.dingzhang.model.User;
import com.dingzhang.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 为方便直接找到jsp使用
 * @author Xiao Xu
 * @create 2017-08-04 11:12
 **/

@Controller
public class JumpController {
    @Autowired
    MenuService menuService;

    @RequestMapping("/quit")
    public ModelAndView quit(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("login");
        request.getSession().invalidate();
        return modelAndView;
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }



    @RequestMapping("/welcome")
    public ModelAndView welcome(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("home");

        HttpSession session = request.getSession();
        User loginUser = (User)session.getAttribute("LoginUser");

        List<MenuModel> menuModels = menuService.getDisplayMenu(loginUser.getAd());
        modelAndView.addObject("menuList",menuModels);
        return modelAndView;
    }
}
