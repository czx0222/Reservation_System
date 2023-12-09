package com.cn.db.service.impl;

import com.cn.db.entity.SportsFacility;
import com.cn.db.mapper.UserReservationMapper;
import com.cn.db.service.UserReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class UserReservationServiceImpl implements UserReservationService {
    @Autowired
    private UserReservationMapper userReservationMapper;
    @Override
    public List<SportsFacility> getAvailableFacilities() {
        return userReservationMapper.getAvailableFacilities();
    }

}
