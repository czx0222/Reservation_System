package com.cn.db.entity;

import java.util.Date;
import lombok.Data;

@Data
public class Announcement {
    private int announcement_id;
    private String content;
    private Date publish_time;
    public void setContent(String content) {
        this.content = content;
    }
}
