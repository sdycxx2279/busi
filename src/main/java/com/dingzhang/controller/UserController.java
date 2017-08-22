package com.dingzhang.controller;

import com.alibaba.fastjson.JSON;
import com.dingzhang.entity.MenuModel;
import com.dingzhang.model.Enterprise;
import com.dingzhang.model.Tag;
import com.dingzhang.model.User;
import com.dingzhang.service.EnterpriseService;
import com.dingzhang.service.MenuService;
import com.dingzhang.service.TagService;
import com.dingzhang.service.UserService;
import com.dingzhang.util.PageUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import static com.dingzhang.constants.Constants.numofEveryPage;

/**
 * @author Xiao Xu
 * @create 2017-08-03 16:59
 **/

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private EnterpriseService enterpriseService;

    @Autowired
    private TagService tagService;

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
    //浏览企业概要
    @RequestMapping("/allEnterprises/{allPages}/{currentPage}/{type}/{name}/{leader}/{member}/{level}/{deadline}/{tag}")
    ModelAndView getAllEnterprises(@PathVariable(value="allPages") int allPages,
                                   @PathVariable(value="currentPage") int currentPage,
                                   @PathVariable(value="type") String type,
                                   @PathVariable(value="name") String name,
                                   @PathVariable(value="leader") String leader,
                                   @PathVariable(value="member") String member,
                                   @PathVariable(value="level") int level ,
                                   @PathVariable(value="deadline") String deadline,
                                   @PathVariable(value="tag") int tag){
        ModelAndView modelAndView = new ModelAndView("enterpriseMap");

        currentPage = PageUtil.getCurrentPage(currentPage,allPages,type);

        //获取并向页面传递用于分页列表的企业信息列表
        Page page = PageHelper.startPage(currentPage, numofEveryPage, "id");
        List<Enterprise> enterpriseList = enterpriseService.getEnterpriseList(name,leader,member,level,deadline,tag);
        modelAndView.addObject("enterpriseList",enterpriseList);

        //总页数
        allPages = page.getPages();
        modelAndView.addObject("allPages", allPages);
        // 当前页码
        currentPage = page.getPageNum();
        modelAndView.addObject("currentPage", currentPage);
        //每页表中项数，用于排序
        modelAndView.addObject("numofEveryPage",numofEveryPage);

        //获取并向页面传递用于地图的企业信息列表
        List<Enterprise> enterprises = enterpriseService.getEnterpriseList(name,leader,member,level,deadline,tag);
        modelAndView.addObject("enterpriseMap", JSON.toJSON(enterprises).toString());

        //获取所有类别信息
        List<Tag> typeList = tagService.getTagList();
        modelAndView.addObject("typeList",typeList);
        modelAndView.addObject("tagList",JSON.toJSON(typeList).toString());

        //获取参数信息
        if (!name.equals("1")) {
            modelAndView.addObject("name", name);
        } else {
            modelAndView.addObject("name", "");
        }
        if (!leader.equals("1")) {
            modelAndView.addObject("leader", leader);
        } else {
            modelAndView.addObject("leader", "");
        }
        if (!member.equals("1")) {
            modelAndView.addObject("member", member);
        } else {
            modelAndView.addObject("member", "");
        }
        if (level!=0) {
            modelAndView.addObject("level", level);
        } else {
            modelAndView.addObject("level", 0);
        }if (!deadline.equals("1")) {
            modelAndView.addObject("deadline", deadline);
        } else {
            modelAndView.addObject("deadline", "");
        }if (tag!=-1) {
            modelAndView.addObject("tag", tag);
        } else {
            modelAndView.addObject("tag", 0);
        }

        return modelAndView;
    }
}
