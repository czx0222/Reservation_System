package com.cn.db.entity;
import lombok.Data;

@Data
public class User {
    private int user_id;
    private String login_name;
    private String password;
    private String full_name;
    private String birthday;
    private String phone;
    private String email;
}
