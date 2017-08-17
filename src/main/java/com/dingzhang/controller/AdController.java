package com.dingzhang.controller;

import com.dingzhang.model.Enterprise;
import com.dingzhang.model.EnterpriseWithBLOBs;
import com.dingzhang.model.Tag;
import com.dingzhang.model.User;
import com.dingzhang.service.EnterpriseService;
import com.dingzhang.service.TagService;
import com.dingzhang.util.DateUtil;
import com.dingzhang.util.ImageUtil;
import com.dingzhang.util.PageUtil;
import com.dingzhang.util.QiniuUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static com.dingzhang.constants.Constants.QINIU_IMAGE_URL;
import static com.dingzhang.constants.Constants.numofEveryPage;
import static com.dingzhang.constants.Constants.uploadImageDir;

/**
 * @author Xiao Xu
 * @create 2017-08-06 20:41
 **/
@Controller
@RequestMapping("/ad")
public class AdController {
    @Autowired
    private TagService tagService;

    @Autowired
    private EnterpriseService enterpriseService;

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
        }
        if (!deadline.equals("1")) {
            modelAndView.addObject("deadline", deadline);
        } else {
            modelAndView.addObject("deadline", "");
        }
        if (tag!=-1) {
            modelAndView.addObject("tag", tag);
        } else {
            modelAndView.addObject("tag", 0);
        }

        return modelAndView;
    }

    //删除企业
    @RequestMapping("/deleteEnterprise/{id}/{allPages}/{currentPage}/{type}/{name}/{leader}/{member}/{level}/{deadline}/{tag}")
    public ModelAndView deleteEnterprise(@PathVariable("id") int id,
                                         @PathVariable(value="allPages") int allPages,
                                         @PathVariable(value="currentPage") int currentPage,
                                         @PathVariable(value="type") String type,
                                         @PathVariable(value="name") String name,
                                         @PathVariable(value="leader") String leader,
                                         @PathVariable(value="member") String member,
                                         @PathVariable(value="level") int level ,
                                         @PathVariable(value="deadline") String deadline,
                                         @PathVariable(value="tag") int tag){
        String src = "redirect:/ad/allEnterprises/"+allPages+"/"+currentPage+"/"+type+"/"+name+"/"+leader+"/"+member
                + "/"+level+"/"+deadline+"/"+tag+".do";
        ModelAndView modelAndView = new ModelAndView(src);
        EnterpriseWithBLOBs oldEnterprise = enterpriseService.getEnterprise(id);

        if(!enterpriseService.deleteEnterprise(id)){
            modelAndView.addObject("message",1);
        }else{
            QiniuUtil.deleteImage(oldEnterprise.getPhoto_boss());
            QiniuUtil.deleteImage(oldEnterprise.getPhoto_leader());
            QiniuUtil.deleteImage(oldEnterprise.getPhoto_member());
        }
        return modelAndView;
    }

    //进入新增企业页面
    @RequestMapping("/addEnterprise")
    public ModelAndView addEnterprise(){
        ModelAndView modelAndView = new ModelAndView("addEnterprise");

        //获取所有类别信息
        List<Tag> typeList = tagService.getTagList();
        modelAndView.addObject("typeList",typeList);

        return modelAndView;
    }

    //新增企业
    @RequestMapping("/addEnterprisePost")
    public ModelAndView addEnterprisePost(HttpServletRequest request,EnterpriseWithBLOBs enterprise,
                                          MultipartFile file1,MultipartFile file2,MultipartFile file3,String deadday){
        ModelAndView modelAndView;

        //获取登录用户以设置文件名
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("LoginUser");
        String fileName1 = getFileName("boss",loginUser.getId(),file1.getContentType());
        String fileName2 = getFileName("leader",loginUser.getId(),file2.getContentType());
        String fileName3= getFileName("member",loginUser.getId(),file3.getContentType());

        //设置企业的图片路径与日期
        if(QiniuUtil.uploadImage(file1,fileName1)){
            enterprise.setPhoto_boss(QINIU_IMAGE_URL+fileName1);
        }
        if(QiniuUtil.uploadImage(file2,fileName2)){
            enterprise.setPhoto_leader(QINIU_IMAGE_URL+fileName2);
        }
        if(QiniuUtil.uploadImage(file3,fileName3)){
            enterprise.setPhoto_member(QINIU_IMAGE_URL+fileName3);
        }
        enterprise.setDeadline(DateUtil.stringConvertDate(deadday));

        //将富文本编辑器里的图片上传到七牛云并替换src
        String path = request.getSession().getServletContext().getRealPath("");
        enterprise.setDescription(QiniuUtil.uploadHtmlImage(path,enterprise.getDescription()));
        enterprise.setQuestion1(QiniuUtil.uploadHtmlImage(path,enterprise.getQuestion1()));
        enterprise.setQuestion2(QiniuUtil.uploadHtmlImage(path,enterprise.getQuestion2()));
        enterprise.setQuestion3(QiniuUtil.uploadHtmlImage(path,enterprise.getQuestion3()));
        enterprise.setQuestion4(QiniuUtil.uploadHtmlImage(path,enterprise.getQuestion4()));
        enterprise.setQuestion5(QiniuUtil.uploadHtmlImage(path,enterprise.getQuestion5()));

        if(enterpriseService.addEnterprise(enterprise)){
            modelAndView = new ModelAndView("redirect:/ad/allEnterprises/0/1/previous/1/1/1/0/1/-1.do");
        }
        else{
            modelAndView = new ModelAndView("addEnterprise");
            modelAndView.addObject("message",1);
        }

        return modelAndView;
    }

    //查看企业详细信息
    @RequestMapping("/enterpriseInfo/{id}")
    public ModelAndView getEnterpriseInfo(@PathVariable("id")int id){
        ModelAndView modelAndView = new ModelAndView("enterpriseInfo");

        EnterpriseWithBLOBs enterprise = enterpriseService.getEnterprise(id);
        List<Tag> tagList = tagService.getTagList();

        modelAndView.addObject("enterprise",enterprise);
        modelAndView.addObject("typeList",tagList);

        return modelAndView;
    }

    //查看可修改的企业详细信息
    @RequestMapping("/editEnterprise/{id}")
    public ModelAndView getEditEnterprise(@PathVariable("id")int id){
        ModelAndView modelAndView = new ModelAndView("editEnterprise");

        EnterpriseWithBLOBs enterprise = enterpriseService.getEnterprise(id);
        List<Tag> tagList = tagService.getTagList();

        modelAndView.addObject("enterprise",enterprise);
        modelAndView.addObject("typeList",tagList);

        String deadline = DateUtil.dateTimaFormat(enterprise.getDeadline());
        modelAndView.addObject("deadline",deadline);

        return modelAndView;
    }

    //修改文章
    @RequestMapping("/editEnterprisePost/{id}")
    public ModelAndView editEnterprisePost(@PathVariable("id")int id,
                                           HttpServletRequest request,EnterpriseWithBLOBs enterprise,
                                           MultipartFile file1,MultipartFile file2,MultipartFile file3,String deadday){
        ModelAndView modelAndView;

        EnterpriseWithBLOBs oldEnterprise = enterpriseService.getEnterprise(id);
        enterprise.setId(id);

        //获取登录用户以设置文件名
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("LoginUser");
        String fileName1 = getFileName("boss",loginUser.getId(),file1.getContentType());
        String fileName2 = getFileName("leader",loginUser.getId(),file2.getContentType());
        String fileName3= getFileName("member",loginUser.getId(),file3.getContentType());

        if(file1.getSize()==0){
            enterprise.setPhoto_boss(oldEnterprise.getPhoto_boss());
        }else{
            QiniuUtil.deleteImage(oldEnterprise.getPhoto_boss());
            if(QiniuUtil.uploadImage(file1,fileName1)){
                enterprise.setPhoto_boss(QINIU_IMAGE_URL+fileName1);
            }
        }
        if(file2.getSize()==0){
            enterprise.setPhoto_leader(oldEnterprise.getPhoto_leader());
        }else{
            QiniuUtil.deleteImage(oldEnterprise.getPhoto_leader());
            if(QiniuUtil.uploadImage(file2,fileName2)){
                enterprise.setPhoto_leader(QINIU_IMAGE_URL+fileName2);
            }
        }
        if(file3.getSize()==0){
            enterprise.setPhoto_member(oldEnterprise.getPhoto_member());
        }else{
            QiniuUtil.deleteImage(oldEnterprise.getPhoto_member());
            if(QiniuUtil.uploadImage(file3,fileName3)){
                enterprise.setPhoto_member(QINIU_IMAGE_URL+fileName3);
            }
        }
        enterprise.setDeadline(DateUtil.stringConvertDate(deadday));

        //将富文本编辑器里的图片上传到七牛云并替换src
        String path = request.getSession().getServletContext().getRealPath("");
        enterprise.setDescription(QiniuUtil.uploadHtmlImage(path,enterprise.getDescription()));
        enterprise.setQuestion1(QiniuUtil.uploadHtmlImage(path,enterprise.getQuestion1()));
        enterprise.setQuestion2(QiniuUtil.uploadHtmlImage(path,enterprise.getQuestion2()));
        enterprise.setQuestion3(QiniuUtil.uploadHtmlImage(path,enterprise.getQuestion3()));
        enterprise.setQuestion4(QiniuUtil.uploadHtmlImage(path,enterprise.getQuestion4()));
        enterprise.setQuestion5(QiniuUtil.uploadHtmlImage(path,enterprise.getQuestion5()));

        if(enterpriseService.editEnterprise(enterprise)){
            modelAndView = new ModelAndView("redirect:/ad/allEnterprises/0/1/previous/1/1/1/0/1/-1.do");

            //删除无用的图片
            QiniuUtil.deleteUnusedImage(oldEnterprise.getDescription(),enterprise.getDescription());
            QiniuUtil.deleteUnusedImage(oldEnterprise.getQuestion1(),enterprise.getQuestion1());
            QiniuUtil.deleteUnusedImage(oldEnterprise.getQuestion2(),enterprise.getQuestion2());
            QiniuUtil.deleteUnusedImage(oldEnterprise.getQuestion3(),enterprise.getQuestion3());
            QiniuUtil.deleteUnusedImage(oldEnterprise.getQuestion4(),enterprise.getQuestion4());
            QiniuUtil.deleteUnusedImage(oldEnterprise.getQuestion5(),enterprise.getQuestion5());
        }
        else{
            modelAndView = new ModelAndView("editEnterprise");

            List<Tag> tagList = tagService.getTagList();

            modelAndView.addObject("enterprise",oldEnterprise);
            modelAndView.addObject("typeList",tagList);

            String deadline = DateUtil.dateTimaFormat(oldEnterprise.getDeadline());
            modelAndView.addObject("deadline",deadline);

            modelAndView.addObject("message",1);
        }

        return modelAndView;
    }


    //生成图片名
    public String getFileName(String man,int id,String contentType){
        String type = contentType.substring(contentType.indexOf('/')+1,contentType.length());
        return ""+id+"_"+DateUtil.dateToFileName()+"_"+man+"."+type;
    }
}