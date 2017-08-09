package com.dingzhang.service;

import com.dingzhang.model.User;

import java.util.List;

/**用户服务接口
 * @author Xiao Xu
 * @create 2017-08-03 16:55
 **/

public interface UserService {
    User login(String username,String password);
    int register(User user);
    List<User> getUserList(String username);
    User getUserInfo(int id);
    boolean updateUser(User user);
    boolean deleteUser(int id);
    int updatePassword(int id,String oldPassword,String password);
 }
