package com.cn.db.mapper;

import com.cn.db.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import java.util.List;

public interface UserMapper {

    List<User> getAllUsers();
    void deleteUserById(int userId);
    void insertUser(User user);
}
