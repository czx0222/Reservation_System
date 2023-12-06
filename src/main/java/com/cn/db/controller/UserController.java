package com.cn.db.controller;

import com.cn.db.entity.User;
import com.cn.db.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/list")
    public String userList(Model model) {
        List<User> userList = userService.getAllUsers();
        model.addAttribute("userList", userList);
        return "back/UserList";
    }
    @PostMapping("/delete/{userId}")
    public String deleteUser(@PathVariable int userId) {
        userService.deleteUserById(userId);
        return "redirect:/user/list";
    }
}
