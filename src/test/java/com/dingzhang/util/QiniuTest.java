package com.dingzhang.util;

import com.dingzhang.BaseTest;
import com.dingzhang.dao.EnterpriseDao;
import com.dingzhang.model.EnterpriseExample;
import com.dingzhang.model.EnterpriseWithBLOBs;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 将图片迁移到另一七牛云
 * 运行时请备份数据库以防止错误难以恢复
 * @author Xiao Xu
 * @create 2017-08-22 18:02
 **/

public class QiniuTest extends BaseTest{
    @Autowired
    private EnterpriseDao enterpriseDao;

    @Test
    public void testAdd() throws Exception {
        EnterpriseExample enterpriseExample = new EnterpriseExample();
        EnterpriseExample.Criteria criteria = enterpriseExample.createCriteria();

        List<EnterpriseWithBLOBs> enterprises = enterpriseDao.selectByExampleWithBLOBs(enterpriseExample);
        for(EnterpriseWithBLOBs enterprise : enterprises){
            enterprise.setPhoto_boss(QiniuUtil.translate(enterprise.getPhoto_boss()));
            enterprise.setPhoto_leader(QiniuUtil.translate(enterprise.getPhoto_leader()));
            enterprise.setPhoto_member(QiniuUtil.translate(enterprise.getPhoto_member()));
            enterprise.setDescription(QiniuUtil.translateHtml(enterprise.getDescription()));
            enterprise.setQuestion1(QiniuUtil.translateHtml(enterprise.getQuestion1()));
            enterprise.setQuestion2(QiniuUtil.translateHtml(enterprise.getQuestion2()));
            enterprise.setQuestion3(QiniuUtil.translateHtml(enterprise.getQuestion3()));
            enterprise.setQuestion4(QiniuUtil.translateHtml(enterprise.getQuestion4()));
            enterprise.setQuestion5(QiniuUtil.translateHtml(enterprise.getQuestion5()));
            enterpriseDao.updateByIdWithBLOBs(enterprise);
        }
    }
}
