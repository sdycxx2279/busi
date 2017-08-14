package com.dingzhang.controller;

import com.dingzhang.entity.MenuModel;
import com.dingzhang.model.User;
import com.dingzhang.service.MenuService;
import com.dingzhang.util.ImageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sun.nio.ch.IOUtil;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;

import static com.dingzhang.constants.Constants.uploadImageDir;


/**
 * 为方便直接找到jsp使用
 *
 * @author Xiao Xu
 * @create 2017-08-04 11:12
 **/

@Controller
public class JumpController {
    public static final Resource PICTURES_DIR = new FileSystemResource("./load");
    @Autowired
    MenuService menuService;

    @RequestMapping("/quit")
    public ModelAndView quit(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("login");
        request.getSession().invalidate();
        return modelAndView;
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }


    @RequestMapping("/welcome")
    public ModelAndView welcome(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("home");

        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("LoginUser");

        List<MenuModel> menuModels = menuService.getDisplayMenu(loginUser.getAd());
        modelAndView.addObject("menuList", menuModels);
        return modelAndView;
    }

    @RequestMapping("/test")
    public String test() {
        return "test";
    }

    @RequestMapping(value = "/upload.do")
    public String upload(MultipartFile file, HttpServletRequest request, ModelMap model) {

        System.out.println("开始");
        String path = request.getSession().getServletContext().getRealPath(uploadImageDir);
        String url = ImageUtil.uploadImage(path,file);

        model.addAttribute("fileUrl", request.getContextPath()+url);

        return "result";
    }
}
