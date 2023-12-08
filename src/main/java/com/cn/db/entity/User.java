package com.cn.db.entity;
import lombok.Data;

import java.util.Date;

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
//package com.cn.db.entity;
//
//        import java.util.Date;
//        import lombok.Data;
//
//@Data
//public class UserAccount {
//    private int userId;
//    private String loginName;
//    private String password;
//    private String fullName;
//    private Date birthday;
//    private String phone;
//    private String email;
//}
