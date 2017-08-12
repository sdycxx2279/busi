package com.dingzhang.service;

import com.dingzhang.BaseTest;
import com.dingzhang.model.Enterprise;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static com.dingzhang.constants.Constants.numofEveryPage;

/**
 * @author Xiao Xu
 * @create 2017-08-11 17:21
 **/

public class EnterpriseServiceTest extends BaseTest{
    @Autowired
    private EnterpriseService enterpriseService;

    @Test
    public void testSelect(){
    }
}
