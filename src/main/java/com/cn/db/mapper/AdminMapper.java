package com.cn.db.mapper;


import com.cn.db.entity.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
    Admin findByUsername(String username);
}