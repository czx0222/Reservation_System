package com.cn.db.controller;

import com.cn.db.entity.Announcement;
import com.cn.db.entity.SportsFacility;
import com.cn.db.entity.User;
import com.cn.db.service.AnnouncementService;
import com.cn.db.service.UserAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/User")
public class LoginController {

    @Autowired
    private UserAccountService userAccountService;

    @RequestMapping("/login")
    public String showLoginPage() {
        return "front/login";
    }

    @PostMapping("/dashboard")
    public String authenticateUser(@RequestParam String login_name, @RequestParam String password, HttpSession session, Model model) {
        int userId = userAccountService.getUserIdByLoginName(login_name);
        if (userAccountService.validateUser(login_name, password)) {
            session.setAttribute("loggedInUserId", userId);
            session.setAttribute("loggedInUser", login_name);
            return "front/userDashboard";
        } else {
            model.addAttribute("errorMessage", "用户名或密码错误");
            return "redirect:/User/login";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loggedInUser");
        return "redirect:/User/login";
    }

    @GetMapping("/userInfo")
    public String showUserInfoPage(HttpSession session, Model model) {
        String loggedInUser = (String) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            User userInfo = userAccountService.getUserInfoByLoginName(loggedInUser);
            model.addAttribute("userInfo", userInfo);
            return "front/userInfo";
        } else {
            return "redirect:/User/login";
        }
    }
    @PostMapping("/updateUserInfo/{userId}")
    public String updateUserInfo(@PathVariable int userId, @ModelAttribute User updatedUserInfo) {
        updatedUserInfo.setUserId(userId);
        boolean success = userAccountService.updateUserInfo(updatedUserInfo);
        if (success) {
            return "redirect:/User/userInfo";
        } else {
            return "errorPage";
        }
    }
    @PostMapping("/updatePassword/{userId}")
    public String updatePassword(@PathVariable int userId,
                                 @RequestParam String currentPassword,
                                 @RequestParam String newPassword,
                                 @RequestParam String confirmNewPassword) {
        if (!newPassword.equals(confirmNewPassword)) {
            return "error";
        }
        boolean success = userAccountService.updatePassword(userId, currentPassword, newPassword);
        if (success) {
            return "redirect:/User/userInfo";
        } else {
            return "error";
        }
    }
    @Autowired
    private AnnouncementService announcementService;
    @GetMapping("/announcements")
    public String showAnnouncementsPage(Model model) {
        List<Announcement> announcements = announcementService.getRecentAnnouncements(6);
        model.addAttribute("announcements", announcements);
        return "front/userannouncements";
    }
}
