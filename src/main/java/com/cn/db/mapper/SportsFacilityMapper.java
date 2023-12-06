package com.cn.db.mapper;

import com.cn.db.entity.SportsFacility;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SportsFacilityMapper {
    List<SportsFacility> getAllFacilities();
    void deleteFacility(int facilityId);
    void updateFacility(SportsFacility sportsFacility);
    void addFacility(SportsFacility sportsFacility);
}
