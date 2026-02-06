package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.demo.service.AdminService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private AdminService adminService;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    
    @GetMapping("/login")
    public String adminLoginPage() {
        return "admin_login";
    }

    
    @PostMapping("/login")
    public String adminLogin(@RequestParam String username,
                             @RequestParam String password,
                             HttpSession session,
                             Model model) {

        var admin = adminService.loginAdmin(username, password);

        if (admin == null) {
            model.addAttribute("error", "Invalid Admin Username or Password");
            return "admin_login";
        }

        session.setAttribute("adminId", admin.getAdminId());
        session.setAttribute("adminUsername", admin.getAdminUsername());

        return "redirect:/admin/dashboard";
    }

    
    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session, Model model) {

        if (session.getAttribute("adminId") == null) {
            return "redirect:/admin/login";
        }

        model.addAttribute("busCount", adminService.getBusCount());
        model.addAttribute("routeCount", adminService.getRouteCount());
        model.addAttribute("feedbackCount", adminService.getFeedbackCount());

        return "admin_dashboard";
    }


    
    @GetMapping("/logout")
    public String adminLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
