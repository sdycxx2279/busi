package com.dingzhang.controller;

import com.dingzhang.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 为方便直接找到jsp使用
 * @author Xiao Xu
 * @create 2017-08-04 11:12
 **/

@Controller
public class JumpController {
    @RequestMapping("/ad")
    String ad(){
        return "ad";
    }

    @RequestMapping("/login")
    String login(){
        return "login";
    }

    @RequestMapping("/welcome")
    String login(HttpServletRequest request){
        HttpSession session = request.getSession();
        User loginUser = (User)session.getAttribute("LoginUser");
        if(loginUser.getAd())
            return "ad";
        else
            return "index";
    }
}
