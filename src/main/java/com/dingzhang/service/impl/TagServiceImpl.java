package com.dingzhang.service.impl;

import com.dingzhang.dao.TagDao;
import com.dingzhang.model.Tag;
import com.dingzhang.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-10 0:01
 **/
@Service("TagService")
public class TagServiceImpl implements TagService{
    @Autowired
    private TagDao tagMapper;

    public List<Tag> getTagList(){
        List<Tag> tagList = tagMapper.selectAll();
        return tagList;
    }

    public boolean addTag(Tag tag){
        int flag = tagMapper.addTag(tag);
        if(flag==1)
            return true;
        else
            return false;
    }

    public boolean deleteTag(int id){
        Tag tag = tagMapper.selectById(id);
        if(tag!=null){
            if(tagMapper.deleteById(id)==1)
                return true;
        }
        return false;
    }

}
