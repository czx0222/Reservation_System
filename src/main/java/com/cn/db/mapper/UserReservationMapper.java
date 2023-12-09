package com.cn.db.mapper;


import com.cn.db.entity.SportsFacility;

import java.util.List;

public interface UserReservationMapper {
    List<SportsFacility> getAvailableFacilities();

}
