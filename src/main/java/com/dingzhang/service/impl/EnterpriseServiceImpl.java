package com.dingzhang.service.impl;

import com.dingzhang.dao.EnterpriseDao;
import com.dingzhang.model.Enterprise;
import com.dingzhang.model.EnterpriseExample;
import com.dingzhang.model.EnterpriseWithBLOBs;
import com.dingzhang.service.EnterpriseService;
import com.dingzhang.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-07 15:37
 **/
@Service
public class EnterpriseServiceImpl implements EnterpriseService{
    @Autowired
    private EnterpriseDao enterpriseDao;

    @Override
    public List<Enterprise> getEnterpriseList(String name, String leader, String member, int level, String deadline, int tag){
        EnterpriseExample enterpriseExample = new EnterpriseExample();
        EnterpriseExample.Criteria criteria = enterpriseExample.createCriteria();

        if(!name.equals("1") && name != null)
            criteria.andNameEqualTo(name);
        if(!leader.equals("1")&& leader!=null)
            criteria.andLeaderEqualTo(leader);
        if(!member.equals("1")&& member!=null)
            criteria.andMemberEqualTo(member);
        if(level>0&&level<4)
            criteria.andLevelEqualTo(level);
        if(DateUtil.isValidDate(deadline) && deadline!=null)
            criteria.andDeadlineEqualTo(DateUtil.stringConvertDate(deadline));
        if(tag>=0)
            criteria.andTypeEqualTo(tag);

        List<Enterprise> enterpriseList = enterpriseDao.selectByExample(enterpriseExample);

        return enterpriseList;
    }

    //根据id删除企业
    @Override
    public boolean deleteEnterprise(int id){
        int flag = enterpriseDao.deleteById(id);
        if(flag==1)
            return true;
        else
            return false;
    }

    //新建一条企业信息
    @Override
    public boolean addEnterprise(EnterpriseWithBLOBs enterprise){
        if(enterpriseDao.insert(enterprise)==1)
            return true;
        else
            return false;
    }

    //根据id获取一条企业信息
    @Override
    public EnterpriseWithBLOBs getEnterprise(int id) {
        EnterpriseWithBLOBs enterpriseWithBLOBs = enterpriseDao.selectById(id);

        return enterpriseWithBLOBs;
    }

    @Override
    public  boolean editEnterprise(EnterpriseWithBLOBs enterprise){
        int flag = enterpriseDao.updateByIdWithBLOBs(enterprise);
        if(flag==1)
            return true;
        else
            return false;
    }
}
