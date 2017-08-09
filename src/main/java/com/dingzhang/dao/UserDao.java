package com.dingzhang.dao;

import com.dingzhang.model.User;

import java.util.List;

/**
 * @author Xiao Xu
 * @create 2017-08-03 15:51
 **/

public interface UserDao {
    User selectByName(String username);
    int addUser(User user);
    List<User> selectAllUsers();
    User selectById(int id);
    int updateUser(User user);
    int deleteById(int id);
}
