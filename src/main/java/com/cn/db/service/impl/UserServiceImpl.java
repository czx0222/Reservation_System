package com.cn.db.service.impl;

import com.cn.db.entity.User;
import com.cn.db.mapper.UserMapper;
import com.cn.db.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;

    @Autowired
    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public List<User> getAllUsers() {
        return userMapper.getAllUsers();
    }
    public void deleteUserById(int userId) {
        userMapper.deleteUserById(userId);
    }
}