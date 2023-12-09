package com.cn.db.mapper;


import com.cn.db.entity.Announcement;
import com.cn.db.entity.ReservationRecord;
import com.cn.db.entity.SportsFacility;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReservationRecordMapper {
    void insertReservationRecord(ReservationRecord reservationRecord);
    List<ReservationRecord> getAllrecord(int userId);
    void deleteRecord(int reservationid);
    List<ReservationRecord> adminGetAllrecord();
    int updateAuditStatus(@Param("reservationId") int reservationId, @Param("auditStatus") String auditStatus);
}
