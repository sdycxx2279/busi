package com.dingzhang.controller;

import com.dingzhang.model.Tag;
import com.dingzhang.service.TagService;
import com.dingzhang.util.PageUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-06 20:41
 **/
@Controller
@RequestMapping("/ad")
public class AdController {
    @Autowired
    TagService tagService;

    //浏览全部标签
    @RequestMapping("/allTags/{allPages}/{currentPage}/{type}")
    public ModelAndView getAllTags(@PathVariable(value="allPages") int allPages,
                                   @PathVariable(value="currentPage") int currentPage,
                                   @PathVariable(value="type") String type){
        ModelAndView modelAndView = new ModelAndView("tagInfo");
        currentPage = PageUtil.getCurrentPage(currentPage,allPages,type);

        Page page = PageHelper.startPage(currentPage, 3, "id");
        List<Tag> tagList = tagService.getTagList();

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

    @RequestMapping("/deleteTag/{id}")
    public ModelAndView deleteTag(@PathVariable("id") int id){
        ModelAndView modelAndView = new ModelAndView("redirect:/ad/allTags/0/1/previous.do");

        if(!tagService.deleteTag(id))
            modelAndView.addObject("flag",-1);
        return modelAndView;
    }
}
