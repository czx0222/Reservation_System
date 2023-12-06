package com.cn.db.service.impl;

import com.cn.db.entity.Announcement;
import com.cn.db.mapper.AnnouncementMapper;
import com.cn.db.service.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {

    @Autowired
    private AnnouncementMapper announcementMapper;

    @Override
    public List<Announcement> getAllAnnouncements() {
        return announcementMapper.getAllAnnouncements();
    }

    @Override
    public void addAnnouncement(Announcement announcement) {
        announcementMapper.addAnnouncement(announcement);
    }

    @Override
    public void deleteAnnouncement(int announcement_id) {
        announcementMapper.deleteAnnouncement(announcement_id);
    }
    @Override
    public boolean updateAnnouncement(Announcement announcement) {
        int rowsAffected = announcementMapper.updateAnnouncement(announcement);
        return rowsAffected > 0;
    }
}
