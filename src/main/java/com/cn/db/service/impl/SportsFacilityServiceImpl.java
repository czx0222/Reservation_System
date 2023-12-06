package com.cn.db.service.impl;

import com.cn.db.entity.SportsFacility;
import com.cn.db.mapper.SportsFacilityMapper;
import com.cn.db.service.SportsFacilityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SportsFacilityServiceImpl implements SportsFacilityService {

    @Autowired
    private SportsFacilityMapper facilityMapper;

    @Override
    public List<SportsFacility> getAllFacilities() {
        return facilityMapper.getAllFacilities();
    }

    @Override
    public void deleteFacility(int facilityId) {
        facilityMapper.deleteFacility(facilityId);
    }
    @Override
    public void updateFacility(SportsFacility sportsFacility) {
        facilityMapper.updateFacility(sportsFacility);
    }
    @Override
    public void addFacility(SportsFacility sportsFacility) {
        facilityMapper.addFacility(sportsFacility);
    }
}

