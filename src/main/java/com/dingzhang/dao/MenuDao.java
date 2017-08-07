package com.dingzhang.dao;

import com.dingzhang.model.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-06 21:01
 **/

public interface MenuDao {
    /**
     *
     * @param parent_id
     * @param status
     * @return
     */
    List<Menu> selectByParent_idAndStatus(@Param("parent_id") int parent_id,@Param("status") int status);
}
