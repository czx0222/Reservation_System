package com.cn.db.service;

import com.cn.db.entity.User;

import java.util.List;

public interface UserService {
    List<User> getAllUsers();
    void deleteUserById(int userId);
    void insertUser(User user);
}
