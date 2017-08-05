package com.dingzhang.service;

import com.dingzhang.model.User;

/**用户服务接口
 * @author Xiao Xu
 * @create 2017-08-03 16:55
 **/

public interface UserService {
    User login(String username,String password);
}
