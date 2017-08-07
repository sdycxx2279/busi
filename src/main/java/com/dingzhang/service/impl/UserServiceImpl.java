package com.dingzhang.service.impl;

import com.dingzhang.dao.UserDao;
import com.dingzhang.model.User;
import com.dingzhang.service.UserService;
import com.dingzhang.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Xiao Xu
 * @create 2017-08-03 16:56
 **/
@Service("UserService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userMapper;

    //登录方法的实现,从jsp页面获取username与password
    public User login(String username, String password) {
        //对输入账号进行查询,取出数据库中保存对信息
        User user = userMapper.selectByName(username);
        if (user != null) {
            String newPassword = MD5Util.MD5(password);
            if (user.getPassword().equals(newPassword)) {
                user.setPassword(null);
                return user;
            }
        }
        return null;

    }

    //验证用户名是否重复
    public boolean hasUsername(String username){
        User user = userMapper.selectByName(username);
        if(user==null)
            return false;
        else
            return true;
    }
}
