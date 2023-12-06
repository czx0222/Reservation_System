package com.cn.db.service.impl;

import com.cn.db.entity.Admin;
import com.cn.db.mapper.AdminMapper;
import com.cn.db.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminServiceImpl implements AdminService {

    private final AdminMapper adminMapper;

    @Autowired
    public AdminServiceImpl(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public Admin login(String username, String password) {
        return adminMapper.findByUsername(username);
    }

}
