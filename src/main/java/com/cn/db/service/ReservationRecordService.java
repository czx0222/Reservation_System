package com.cn.db.service;

import com.cn.db.entity.Announcement;
import com.cn.db.entity.ReservationRecord;

import java.util.List;

public interface ReservationRecordService {
    boolean insertReservationRecord(ReservationRecord reservationRecord);
    List<ReservationRecord> getAllreord(int userId);
    void deleteRecord(int reservationid);
    List<ReservationRecord> adminGetAllrecord();
    boolean performAudit(int reservationId, String action);

}
