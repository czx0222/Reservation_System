package com.cn.db.controller;

import com.cn.db.entity.SportsFacility;
import com.cn.db.service.SportsFacilityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/facilities")
public class FacilityController {

    @Autowired
    private SportsFacilityService facilityService;

    @GetMapping("/list")
    public String listFacilities(Model model) {
        List<SportsFacility> facilities = facilityService.getAllFacilities();
        model.addAttribute("facilities", facilities);
        return "back/FacilityList";
    }

    @GetMapping("/delete/{facilityId}")
    public String deleteFacility(@PathVariable int facilityId) {
        facilityService.deleteFacility(facilityId);
        return "redirect:/facilities/list";
    }
    @PostMapping("/edit/{facilityId}")
    public String editFacility(@PathVariable int facilityId, @ModelAttribute SportsFacility updatedFacility) {
        updatedFacility.setFacilityId(facilityId);
        facilityService.updateFacility(updatedFacility);
        return "redirect:/facilities/list";
    }
    @PostMapping("/add")
    public String addFacility(@ModelAttribute SportsFacility newFacility) {
        facilityService.addFacility(newFacility);
        return "redirect:/facilities/list";
    }
}
