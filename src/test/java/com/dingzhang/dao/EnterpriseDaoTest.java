package com.dingzhang.dao;

import com.dingzhang.BaseTest;
import com.dingzhang.model.Enterprise;
import com.dingzhang.model.EnterpriseExample;
import com.dingzhang.model.EnterpriseWithBLOBs;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-06 22:37
 **/

public class EnterpriseDaoTest extends BaseTest {
    @Autowired
    private EnterpriseDao enterpriseDao;

    @Test
    public void testAdd() throws Exception {

    }

    @Test
    public void testSelect() throws Exception {
        EnterpriseExample example = new EnterpriseExample();
        EnterpriseExample.Criteria  criteria = example.createCriteria();
        criteria.andIdEqualTo(1);
        List<EnterpriseWithBLOBs> enterprises = enterpriseDao.selectByExampleWithBLOBs(example);
        for(Enterprise enterprise:enterprises) {
            System.out.println(enterprise.getId());
        }
    }

}
