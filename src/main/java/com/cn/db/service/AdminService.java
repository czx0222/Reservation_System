package com.cn.db.service;

import com.cn.db.entity.Admin;

public interface AdminService {
    Admin login(String username, String password);
}