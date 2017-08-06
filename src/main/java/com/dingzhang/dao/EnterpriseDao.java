package com.dingzhang.dao;

import com.dingzhang.model.Enterprise;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-05 18:00
 **/

public interface EnterpriseDao {
    List<Enterprise> selectAll();
    int addEnterprise(Enterprise enterprise);
}
