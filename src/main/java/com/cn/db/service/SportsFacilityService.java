package com.cn.db.service;

import com.cn.db.entity.SportsFacility;

import java.util.List;

public interface SportsFacilityService {
    List<SportsFacility> getAllFacilities();
    void deleteFacility(int facilityId);
    void updateFacility(SportsFacility sportsFacility);
    void addFacility(SportsFacility sportsFacility);
}
