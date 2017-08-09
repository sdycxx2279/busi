package com.dingzhang.service.impl;

import com.dingzhang.dao.UserDao;
import com.dingzhang.model.User;
import com.dingzhang.service.UserService;
import com.dingzhang.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    //注册账号
    public int register(User user){
        User hasUser = userMapper.selectByName(user.getUsername());
        if(hasUser==null) {
            String encryptPassword = MD5Util.MD5(user.getPassword());
            user.setPassword(encryptPassword);
            int a = userMapper.addUser(user);
            if(a==1)
                return 1;
            else
                return -1;
        }
        else
            return 0;
    }

    public List<User> getUserList(String username){

        List<User> userList;
        if(username.equals("1")){
            userList=userMapper.selectAllUsers();
        }else{
            userList = new ArrayList<User>();
            userList.add(userMapper.selectByName(username));
        }

        return userList;
    }

    public User getUserInfo(int id){
        User user = userMapper.selectById(id);
        return user;
    }

    public boolean updateUser(User user){
        user.setPassword(userMapper.selectByName(user.getUsername()).getPassword());
        int flag = userMapper.updateUser(user);
        if(flag==1)
            return true;
        else
            return false;
    }

    public boolean deleteUser(int id){
        int flag = userMapper.deleteById(id);
        if(flag==1)
            return true;
        else
            return false;
    }

    //返回1代表修改成功，返回2代表旧密码不正确，返回3代表系统故障
    public int updatePassword(int id,String oldPassword,String password){
        User user = userMapper.selectById(id);
        String encryptOldPassword = MD5Util.MD5(oldPassword);
        if(encryptOldPassword.equals(user.getPassword())){
            user.setPassword(MD5Util.MD5(password));
            if(userMapper.updateUser(user)==1)
                return 1;
            else
                return 3;
        }else
            return 2;
    }
}
