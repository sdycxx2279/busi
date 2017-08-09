package com.dingzhang.dao;

import com.dingzhang.BaseTest;
import com.dingzhang.model.Enterprise;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-06 22:37
 **/

public class EnterpriseDaoTest extends BaseTest {
    @Autowired
    EnterpriseDao enterpriseMapper;

    @Test
    public void testAdd() throws Exception {

    }

    @Test
    public void testSelect() throws Exception {
        List<Enterprise> enterprises = enterpriseMapper.selectAll();
        for(Enterprise enterprise:enterprises) {
            System.out.println(enterprise.toString());
        }
    }

}
