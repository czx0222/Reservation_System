package com.cn.db.service;

import com.cn.db.entity.ReservationRecord;
import com.cn.db.entity.SportsFacility;
import org.springframework.stereotype.Service;

import java.util.List;


public interface UserReservationService {

    List<SportsFacility> getAvailableFacilities();

}
