package com.cn.db.mapper;

import com.cn.db.entity.User;

public interface UserAccountMapper {
    User getUserByLoginName(String login_name);
    User getUserInfoByLoginName(String login_name);
    int updateUserInfo(User user);
    void updateUserPassword(User user);
    User getUserById(int user_id);
}
