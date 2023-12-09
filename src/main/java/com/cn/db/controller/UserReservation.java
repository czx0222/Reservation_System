package com.cn.db.controller;

import com.cn.db.entity.ReservationRecord;
import com.cn.db.entity.SportsFacility;
import com.cn.db.service.UserReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/User")
public class UserReservation{
    @Autowired
    private UserReservationService userReservationService;

    @GetMapping("/reservation")
    public String showReservationPage(Model model) {
        List<SportsFacility> availableFacilities = userReservationService.getAvailableFacilities();
        model.addAttribute("availableFacilities", availableFacilities);
        return "front/reservation";
    }

}
