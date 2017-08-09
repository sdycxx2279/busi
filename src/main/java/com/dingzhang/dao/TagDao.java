package com.dingzhang.dao;

import com.dingzhang.model.Tag;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-09 1:10
 **/

public interface TagDao {
    /**
     *返回全部标签
     * @return
     */
    List<Tag> selectAll();

    /**
     * 新增标签
     * @param tag
     * @return
     */
    int addTag(Tag tag);

    /**
     *更新标签
     * @param tag
     * @return
     */
    int updateById(Tag tag);

    /**
     *删除标签
     * @param id
     * @return
     */
    int deleteById(int id);

    /**
     * 通过id查询标签
     * @param id
     * @return
     */
    Tag selectById(int id);

}
