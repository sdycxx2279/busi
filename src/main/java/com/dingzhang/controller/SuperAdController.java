package com.dingzhang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Xiao Xu
 * @create 2017-08-06 20:41
 **/
@Controller
@RequestMapping("/superad")
public class SuperAdController {
    @RequestMapping("/add")
    public ModelAndView addUser(){
        ModelAndView modelAndView = new ModelAndView("addUser");
        return modelAndView;
    }
}
