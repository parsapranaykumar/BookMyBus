package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.service.ReservationService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminReservationController {

    private ReservationService reservationService;

    public AdminReservationController(ReservationService reservationService) {
        this.reservationService = reservationService;
    }

    @GetMapping("/reservations")
    public String viewReservations(HttpSession session, Model model) {

        if (session.getAttribute("adminId") == null) {
            return "redirect:/admin/login";
        }

        model.addAttribute("reservations", reservationService.getAllReservations());
        return "admin_reservations";
    }
}
