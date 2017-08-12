package com.dingzhang.controller;

import com.dingzhang.model.Enterprise;
import com.dingzhang.model.Tag;
import com.dingzhang.service.EnterpriseService;
import com.dingzhang.service.TagService;
import com.dingzhang.util.PageUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static com.dingzhang.constants.Constants.numofEveryPage;

/**
 * @author Xiao Xu
 * @create 2017-08-06 20:41
 **/
@Controller
@RequestMapping("/ad")
public class AdController {
    @Autowired
    TagService tagService;

    @Autowired
    EnterpriseService enterpriseService;

    //浏览全部标签
    @RequestMapping("/allTags/{allPages}/{currentPage}/{type}")
    public ModelAndView getAllTags(@PathVariable(value="allPages") int allPages,
                                   @PathVariable(value="currentPage") int currentPage,
                                   @PathVariable(value="type") String type){
        ModelAndView modelAndView = new ModelAndView("tagInfo");
        currentPage = PageUtil.getCurrentPage(currentPage,allPages,type);

        Page page = PageHelper.startPage(currentPage, numofEveryPage, "id");
        List<Tag> tagList = tagService.getTagList();

        modelAndView.addObject("numofEveryPage",numofEveryPage);
        modelAndView.addObject("tagList",tagList);
        //总页数
        allPages = page.getPages();
        modelAndView.addObject("allPages", allPages);
        // 当前页码
        currentPage = page.getPageNum();
        modelAndView.addObject("currentPage", currentPage);

        return modelAndView;
    }

    //新增标签
    @RequestMapping("/addTag")
    public ModelAndView addTag(Tag tag){
        ModelAndView modelAndView = new ModelAndView("redirect:/ad/allTags/0/1/previous.do");

        if(!tagService.addTag(tag))
            modelAndView.addObject("flag",-1);
        return modelAndView;
    }

    //删除标签
    @RequestMapping("/deleteTag/{id}")
    public ModelAndView deleteTag(@PathVariable("id") int id){
        ModelAndView modelAndView = new ModelAndView("redirect:/ad/allTags/0/1/previous.do");

        if(!tagService.deleteTag(id))
            modelAndView.addObject("flag",-1);
        return modelAndView;
    }

    //修改标签
    @RequestMapping("editTag/{id}/{tagName}")
    public ModelAndView editTag(@PathVariable("id") int id,@PathVariable("tagName") String tagName){
        ModelAndView modelAndView = new ModelAndView("redirect:/ad/allTags/0/1/previous.do");

        if(!tagService.updateTag(id,tagName))
            modelAndView.addObject("flag",-1);
        return modelAndView;
    }

    //管理企业概要
    @RequestMapping("allEnterprises/{allPages}/{currentPage}/{type}/{name}/{leader}/{member}/{level}/{deadline}/{tag}")
    public ModelAndView editAllEnterprises(@PathVariable(value="allPages") int allPages,
                                           @PathVariable(value="currentPage") int currentPage,
                                           @PathVariable(value="type") String type,
                                           @PathVariable(value="name") String name,
                                           @PathVariable(value="leader") String leader,
                                           @PathVariable(value="member") String member,
                                           @PathVariable(value="level") int level ,
                                           @PathVariable(value="deadline") String deadline,
                                           @PathVariable(value="tag") int tag){
        ModelAndView modelAndView = new ModelAndView("allEnterprises");
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

        //获取所有类别信息
        List<Tag> typeList = tagService.getTagList();
        modelAndView.addObject("typeList",typeList);

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
            modelAndView.addObject("level", "");
        }if (!deadline.equals("1")) {
            modelAndView.addObject("deadline", deadline);
        } else {
            modelAndView.addObject("deadline", "");
        }if (tag!=-1) {
            modelAndView.addObject("tag", tag);
        } else {
            modelAndView.addObject("tag", "");
        }



        return modelAndView;
    }


}
