package com.dingzhang.service;

import com.dingzhang.model.Enterprise;
import com.dingzhang.model.EnterpriseWithBLOBs;

import java.util.Date;
import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-07 15:36
 **/

public interface EnterpriseService {
    /**
     * 根据查询条件获取对应的企业信息列表
     * @param name
     * @param leader
     * @param member
     * @param level
     * @param deadline
     * @param tag
     * @return
     */
    List<Enterprise> getEnterpriseList(String name, String leader, String member, int level, String deadline, int tag);

    /**
     * 根据id删除企业
     * @param id
     * @return
     */
    boolean deleteEnterprise(int id);

    /**
     * 新增一条企业
     * @param enterprise
     * @return
     */
    boolean addEnterprise(EnterpriseWithBLOBs enterprise);

    /**
     * 根据id获取一条具体的企业信息
     * @param id
     * @return
     */
    EnterpriseWithBLOBs getEnterprise(int id);
}
