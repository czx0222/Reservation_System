package com.cn.db.service;

import com.cn.db.entity.Announcement;

import java.util.List;

public interface AnnouncementService {
    List<Announcement> getAllAnnouncements();
    void addAnnouncement(Announcement announcement);
    void deleteAnnouncement(int announcement_id);
    boolean updateAnnouncement(Announcement announcement);
    List<Announcement> getRecentAnnouncements(int count);
}
