package com.cn.db.controller;

import com.cn.db.entity.Announcement;
import com.cn.db.service.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/announcements")
public class AnnouncementController {

    @Autowired
    private AnnouncementService announcementService;

    @GetMapping("/list")
    public String listAnnouncements(Model model) {
        List<Announcement> announcements = announcementService.getAllAnnouncements();
        model.addAttribute("announcements", announcements);
        return "back/AnnouncementList";
    }

    @PostMapping("/add")
    public String addAnnouncement(@ModelAttribute("announcement") Announcement announcement) {
        announcement.setPublish_time(new Date());
        announcementService.addAnnouncement(announcement);
        return "redirect:/announcements/list";
    }

    @GetMapping("/delete/{announcement_id}")
    public String deleteAnnouncement(@PathVariable int announcement_id) {
        announcementService.deleteAnnouncement(announcement_id);
        return "redirect:/announcements/list";
    }
    @PostMapping("/edit/{announcementId}")
    public String editAnnouncement(@PathVariable int announcementId, Announcement editedAnnouncement) {
        editedAnnouncement.setAnnouncement_id(announcementId);
        boolean updated = announcementService.updateAnnouncement(editedAnnouncement);
        if (updated) {
            return "redirect:/announcements/list";
        } else {
            return "errorPage";
        }
    }

}
