package com.cn.db.entity;
import lombok.Data;

import java.util.Date;

@Data
public class User {
    private int userId;
    private String login_name;
    private String password;
    private String full_name;
    private String birthday;
    private String phone;
    private String email;
}

