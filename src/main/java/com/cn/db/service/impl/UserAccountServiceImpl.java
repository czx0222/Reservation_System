package com.cn.db.service.impl;

import com.cn.db.entity.User;
import com.cn.db.entity.User;
import com.cn.db.mapper.UserAccountMapper;
import com.cn.db.service.UserAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserAccountServiceImpl implements UserAccountService {

    @Autowired
    private UserAccountMapper userAccountMapper;

    @Override
    public boolean validateUser(String login_name, String password) {
        User user = userAccountMapper.getUserByLoginName(login_name);
        return user != null && user.getPassword().equals(password);
    }
    @Override
    public User getUserInfoByLoginName(String login_name) {
        return userAccountMapper.getUserInfoByLoginName(login_name);
    }
    @Override
    public  int getUserIdByLoginName(String login_name){
        return  userAccountMapper.getUserIdByLoginName(login_name);
    }
    @Override
    public boolean updateUserInfo(User updatedUserInfo) {
        try {
            int rowsAffected = userAccountMapper.updateUserInfo(updatedUserInfo);
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    @Override
    public boolean updatePassword(int userId, String currentPassword, String newPassword) {
        User user = userAccountMapper.getUserById(userId);
        if (user != null && user.getPassword().equals(currentPassword)) {
            user.setPassword(newPassword);
            userAccountMapper.updateUserPassword(user);
            return true;
        }

        return false;
    }
}