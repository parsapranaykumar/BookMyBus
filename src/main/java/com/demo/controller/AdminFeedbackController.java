package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.demo.repository.FeedbackRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminFeedbackController {

    private FeedbackRepository fbRepo;

    public AdminFeedbackController(FeedbackRepository fbRepo) {
        this.fbRepo = fbRepo;
    }

    @GetMapping("/feedback")
    public String viewFeedback(HttpSession session, Model model) {

        if (session.getAttribute("adminId") == null) {
            return "redirect:/admin/login";
        }

        model.addAttribute("feedbacks", fbRepo.findAll());
        return "admin_feedback";
    }

    @GetMapping("/feedback/delete/{id}")
    public String deleteFeedback(@PathVariable Long id, HttpSession session) {

        if (session.getAttribute("adminId") == null) {
            return "redirect:/admin/login";
        }

        fbRepo.deleteById(id);
        return "redirect:/admin/feedback";
    }
}
