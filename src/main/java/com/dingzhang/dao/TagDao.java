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
     *新增标签
     * @return
     */
    int addTag();

    /**
     *更新标签
     * @return
     */
    int updateById();

    /**
     *删除标签
     * @return
     */
    int deleteById();

}
