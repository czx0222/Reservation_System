package com.cn.db.mapper;

import com.cn.db.entity.Announcement;

import java.util.List;

public interface AnnouncementMapper {
    List<Announcement> getAllAnnouncements();
    void addAnnouncement(Announcement announcement);
    void deleteAnnouncement(int announcement_id);
    int updateAnnouncement(Announcement announcement);
    List<Announcement> getRecentAnnouncements(int count);
}
