package com.dingzhang.controller;

import com.dingzhang.model.User;
import com.dingzhang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Xiao Xu
 * @create 2017-08-03 16:59
 **/

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    //登录系统
    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request){
        //调用login方法来验证是否是注册用户
        if(user.getUsername()=="")
            request.setAttribute("message","用户名不可为空");
        else if(user.getPassword()=="")
            request.setAttribute("message","密码不可为空");
        else{
            User loginUser = userService.login(user.getUsername(),user.getPassword());
            if(loginUser!=null){
                //如果验证通过,则将用户信息传到前台
                HttpSession session = request.getSession();
                session.setAttribute("LoginUser",loginUser);

                return "redirect:/welcome.do";
            }else
                //若不对,则显示错误信息
                request.setAttribute("message","用户名密码错误");
        }
        return "login";
    }
}
