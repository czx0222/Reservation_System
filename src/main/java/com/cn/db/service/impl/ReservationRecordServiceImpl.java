package com.cn.db.service.impl;

import com.cn.db.entity.ReservationRecord;
import com.cn.db.mapper.ReservationRecordMapper;
import com.cn.db.service.ReservationRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationRecordServiceImpl implements ReservationRecordService {
    @Autowired
    private ReservationRecordMapper reservationRecordMapper;
    @Override
    public boolean insertReservationRecord(ReservationRecord reservationRecord){
        try {
            reservationRecordMapper.insertReservationRecord(reservationRecord);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    @Override
    public List<ReservationRecord> getAllreord(int userId){
        return reservationRecordMapper.getAllrecord(userId);
    }
    @Override
    public void deleteRecord(int  reservationid){
        reservationRecordMapper.deleteRecord( reservationid);
    }
    @Override
    public List<ReservationRecord> adminGetAllrecord(){
        return reservationRecordMapper.adminGetAllrecord();
    }
    @Override
    public boolean performAudit(int reservationId, String action) {
        String auditStatus = "reject";
        if ("approve".equals(action)) {
            auditStatus = "approve";
        }
        int rowsAffected = reservationRecordMapper.updateAuditStatus(reservationId, auditStatus);
        return rowsAffected > 0;
    }

}
