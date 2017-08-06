package com.dingzhang.dao;

import com.dingzhang.model.Menu;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-06 21:01
 **/

public interface MenuDao {
    List<Menu> selectByParent_id(int parent_id);
}
