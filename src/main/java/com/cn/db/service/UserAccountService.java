package com.cn.db.service;

import com.cn.db.entity.User;

public interface UserAccountService {
    boolean validateUser(String login_name, String password);
    User getUserInfoByLoginName(String login_name);
    boolean updateUserInfo(User updatedUserInfo);

    boolean updatePassword(int userId, String currentPassword, String newPassword);
}
