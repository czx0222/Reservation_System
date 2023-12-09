package com.cn.db.controller;

import com.cn.db.entity.Admin;
import com.cn.db.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/admin")
public class AdminController {

    private final AdminService adminService;

    @Autowired
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @RequestMapping("/login")
    public String loginPage() {
        return "back/AdminLogin";
    }

    @PostMapping("/login")
    public String login(String username, String password, Model model, HttpSession session) {
        System.out.println("Received username: " + username);
        System.out.println("Received password: " + password);
        Admin admin = adminService.login(username);
        if (admin != null) {
            session.setAttribute("admin", admin);
            return "redirect:/admin/dashboard"; // Redirect to the admin dashboard
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "back/AdminLogin";
        }
    }

    @RequestMapping("/dashboard")
    public String dashboard(HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            return "back/AdminDashboard";
        } else {
            return "redirect:/admin/login";
        }
    }
}