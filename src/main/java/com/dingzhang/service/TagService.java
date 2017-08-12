package com.dingzhang.service;

import com.dingzhang.model.Tag;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-10 0:00
 **/

public interface TagService {
    /**
     * 获取所有类别
     * @return
     */
    List<Tag> getTagList();
    boolean addTag(Tag tag);
    boolean deleteTag(int id);
    boolean updateTag(int id,String tagName);
}
