package com.cn.db.entity;

import java.math.BigDecimal;
import lombok.Data;

@Data
public class SportsFacility {
    private int facilityId;
    private String facilityName;
    private String facilityPhoto;
    private String facilityDescription;
    private String usageStatus;
    private BigDecimal usageFee;
}