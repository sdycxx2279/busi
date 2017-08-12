package com.dingzhang.controller;

import com.alibaba.fastjson.JSON;
import com.dingzhang.model.User;
import com.dingzhang.service.UserService;
import com.dingzhang.util.PageUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import static com.dingzhang.constants.Constants.numofEveryPage;

/**
 * @author Xiao Xu
 * @create 2017-08-06 20:41
 **/
@Controller
@RequestMapping("/superad")
public class SuperAdController {
    @Autowired
    UserService userService;

    @RequestMapping("/add")
    public ModelAndView add(){
        ModelAndView modelAndView = new ModelAndView("addUser");
        return modelAndView;
    }

    @RequestMapping("addUser")
    public  ModelAndView addUser(User user){
        ModelAndView modelAndView;
        modelAndView = new ModelAndView("addUser");
        int sign = userService.register(user);

        if(sign==0)
            modelAndView.addObject("flag",1);
        else if(sign==-1)
            modelAndView.addObject("flag",-1);
        else if(sign==1)
            modelAndView = new ModelAndView("redirect:/superad/allUsers/0/1/previous/1.do");
        return modelAndView;
    }

    @RequestMapping("/allUsers/{allPages}/{currentPage}/{type}/{userName}")
    public ModelAndView getAllUsers(@PathVariable(value="allPages") int allPages,
                                    @PathVariable(value="currentPage") int currentPage,
                                    @PathVariable(value="type") String type,
                                    @PathVariable(value="userName")String userName){
        ModelAndView modelAndView = new ModelAndView("allUsers");
        currentPage = PageUtil.getCurrentPage(currentPage,allPages,type);

        Page page = PageHelper.startPage(currentPage, numofEveryPage, "id");
        List<User> userList = userService.getUserList(userName);

        modelAndView.addObject("numofEveryPage",numofEveryPage);
        modelAndView.addObject("userList", userList);
        modelAndView.addObject("user", JSON.toJSON(userList).toString());
        //总页数
        allPages = page.getPages();
        modelAndView.addObject("allPages", allPages);
        // 当前页码
        currentPage = page.getPageNum();
        modelAndView.addObject("currentPage", currentPage);
        if (!userName.equals("1")) {
            modelAndView.addObject("username", userName);
        } else {
            modelAndView.addObject("username", "");
        }

        return modelAndView;
    }

    @RequestMapping("/userInfo/{id}")
    public ModelAndView getUserInfo(@PathVariable(value="id") int id){
        ModelAndView modelAndView = new ModelAndView("userInfo");
        User user = userService.getUserInfo(id);
        modelAndView.addObject("user",user);
        return modelAndView;
    }

    @RequestMapping("/editUser/{id}")
    public ModelAndView editUser(@PathVariable(value="id") int id,User user){
        ModelAndView modelAndView;
        if(userService.updateUser(user))
            modelAndView = new ModelAndView("redirect:/superad/allUsers/0/1/previous/1.do");
        else{
            modelAndView = new ModelAndView("userInfo");
            User editUser = userService.getUserInfo(id);
            modelAndView.addObject("user",editUser);
            modelAndView.addObject("flag",1);
        }
        return modelAndView;
    }

    @RequestMapping("/deleteUser/{id}")
    public ModelAndView deleteUser(@PathVariable(value="id") int id){
        ModelAndView modelAndView = new ModelAndView("redirect:/superad/allUsers/0/1/previous/1.do");
        userService.deleteUser(id);
        return modelAndView;
    }
}
