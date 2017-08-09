package com.dingzhang.controller;

import com.dingzhang.model.MenuModel;
import com.dingzhang.model.User;
import com.dingzhang.service.MenuService;
import com.dingzhang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-03 16:59
 **/

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    MenuService menuService;

    //登录系统
    @RequestMapping("/login")
    public ModelAndView login(User user, HttpServletRequest request){
        //调用login方法来验证是否是注册用户
        ModelAndView modelAndView = new ModelAndView("login");
        if(user.getUsername()=="")
            request.setAttribute("message","用户名不可为空");
        else if(user.getPassword()=="")
            request.setAttribute("message","密码不可为空");
        else{
            User loginUser = userService.login(user.getUsername(),user.getPassword());
            if(loginUser!=null){
                modelAndView = new ModelAndView("home");
                //如果验证通过,则将用户信息传到前台
                HttpSession session = request.getSession();
                session.setAttribute("LoginUser",loginUser);

                List<MenuModel> menuModels = menuService.getDisplayMenu(loginUser.getAd());
                modelAndView.addObject("menuList",menuModels);
                return modelAndView;
            }else
                //若不对,则显示错误信息
                request.setAttribute("message","用户名密码错误");
        }
        return modelAndView;
    }

    //进入密码修改页面
    @RequestMapping("/edit")
    ModelAndView edit(){
        ModelAndView modelAndView = new ModelAndView("editPass");

        return modelAndView;
    }

    //进行密码修改
    @RequestMapping("/editPassword")
    ModelAndView editPassword(HttpServletRequest request,String oldPassword,String password){
        ModelAndView modelAndView = new ModelAndView("editPass");

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("LoginUser");

        int flag = userService.updatePassword(user.getId(),oldPassword,password);
        modelAndView.addObject("flag",flag);

        return modelAndView;
    }
}
