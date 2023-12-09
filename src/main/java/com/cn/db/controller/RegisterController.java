package com.cn.db.controller;

import com.cn.db.entity.User;
import com.cn.db.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/User")
public class RegisterController {
    @Autowired
    private UserService userService;

    @RequestMapping("/register")
    public String showLoginPage() {
        return "front/register";
    }

    @PostMapping("/success")
    public String registerUser(@RequestParam String login_name, @RequestParam String password,
                               @RequestParam String confirmPassword) {
        if (password.equals(confirmPassword)) {
            User user = new User();
            user.setLogin_name(login_name);
            user.setPassword(password);
            userService.insertUser(user);
            return "front/login";
        } else {
            return "errorPage";
        }
    }
}
