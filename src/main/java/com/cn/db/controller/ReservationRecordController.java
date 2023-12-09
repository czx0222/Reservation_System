package com.cn.db.controller;

import com.cn.db.entity.ReservationRecord;
import com.cn.db.service.ReservationRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/User")
public class ReservationRecordController {

    @Autowired
    private ReservationRecordService reservationRecordService;

    @PostMapping("/submit")
    public String submitReservation(@ModelAttribute ReservationRecord reservationRecord
                        ,HttpSession  session          ) {
        int userId = (int) session.getAttribute("loggedInUserId");
        reservationRecord.setUserId(userId);

        boolean success = reservationRecordService.insertReservationRecord(reservationRecord);
        if (success) {
            return "redirect:/User/reservation";
        } else {
            return "errorPage";
        }
    }
    @GetMapping("/Record")
    public String UserReservationRecords(Model model,HttpSession session){
        int userId = (int) session.getAttribute("loggedInUserId");
        List<ReservationRecord> userReservationRecords = reservationRecordService.getAllreord(userId);
        model.addAttribute("userReservationRecords", userReservationRecords);
        return "front/UserRecord";
    }

    @GetMapping("/delete/{reservationid}")
    public String deleteRecord(@PathVariable int reservationid ) {
        reservationRecordService.deleteRecord(reservationid);
        return "redirect:/User/Record";
    }

    @GetMapping("/recordlist")
    public String AdmingetRecords(Model model,HttpSession session){
        List<ReservationRecord> adminRecords = reservationRecordService.adminGetAllrecord();
        model.addAttribute("adminRecords", adminRecords);
        return "back/reviewRecord";
    }

    @PostMapping("/performAudit")
    public String performAudit(@RequestParam("reservationId") int reservationId,
                               @RequestParam("action") String action) {
        boolean success = reservationRecordService.performAudit(reservationId, action);
        if (success) {
            return "redirect:/User/recordlist";
        } else {

            return "errorPage";
        }
    }
}
