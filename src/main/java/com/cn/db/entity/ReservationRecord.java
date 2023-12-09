package com.cn.db.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@Data

public class ReservationRecord {
    private int reservationid;
    private int userId;
    private int facilityId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endTime;
    private double facilityFee;
    private String auditStatus;
}
