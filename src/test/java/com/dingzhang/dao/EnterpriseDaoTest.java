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
        Date date = new Date();
        Enterprise enterprise = new Enterprise("20",19,18,17,"16","15","14","13","12","11","10","9","8",7, date,"5","4","3","2","1");
        int a = enterpriseMapper.addEnterprise(enterprise);
        System.out.println(enterprise.toString());
    }

    @Test
    public void testSelect() throws Exception {
        List<Enterprise> enterprises = enterpriseMapper.selectAll();
        for(Enterprise enterprise:enterprises) {
            System.out.println(enterprise.toString());
        }
    }

}
