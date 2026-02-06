package com.demo.controller;

import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.demo.model.Feedback;
import com.demo.model.Reservation;
import com.demo.model.User;
import com.demo.repository.FeedbackRepository;
import com.demo.repository.ReservationRepository;
import com.demo.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class FeedbackController {

    private FeedbackRepository fbRepo;
    private ReservationRepository resRepo;
    private UserRepository userRepo;

    public FeedbackController(FeedbackRepository fbRepo,
                              ReservationRepository resRepo,
                              UserRepository userRepo) {
        this.fbRepo = fbRepo;
        this.resRepo = resRepo;
        this.userRepo = userRepo;
    }

    @GetMapping("/feedback/{reservationId}")
    public String feedbackForm(@PathVariable Long reservationId,
                               HttpSession session,
                               Model model) {

        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/user/login";

        Reservation r = resRepo.findById(reservationId).orElse(null);
        if (r == null) return "redirect:/myreservations";

        // ✅ Restriction: journey must be ended
        if (!r.isJourneyEnded()) {
            model.addAttribute("error", "Feedback allowed only after Journey End!");
            return "feedback_error";
        }

        model.addAttribute("reservation", r);
        model.addAttribute("feedback", new Feedback());
        return "feedback";
    }

    @PostMapping("/feedback/save")
    public String saveFeedback(@RequestParam Long reservationId,
                               @ModelAttribute("feedback") Feedback feedback,
                               HttpSession session) {

        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/user/login";

        Reservation r = resRepo.findById(reservationId).orElse(null);
        if (r == null) return "redirect:/myreservations";

        if (!r.isJourneyEnded()) {
            return "redirect:/myreservations";
        }

        User user = userRepo.findById(userId).orElse(null);

        feedback.setReservation(r);
        feedback.setBus(r.getBus());
        feedback.setUser(user);
        feedback.setSubmittedAt(LocalDateTime.now());

        fbRepo.save(feedback);

        return "redirect:/myreservations";
    }
}
