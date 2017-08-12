package com.dingzhang.service;

import com.dingzhang.model.Enterprise;

import java.util.Date;
import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-07 15:36
 **/

public interface EnterpriseService {
    List<Enterprise> getEnterpriseList(String name, String leader, String member, int level, String deadline, int tag);
}
