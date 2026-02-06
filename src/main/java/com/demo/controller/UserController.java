package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.demo.model.User;
import com.demo.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }
    
    @GetMapping("/home")
    public String userHome(HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/user/login";
        }
        return "user_ui";
    }

    
    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("user", new User());
        return "user_register";
    }

    
    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") User user, Model model) {

        userService.registerUser(user);
        model.addAttribute("success", "Registration successful! Please login.");
        return "user_login";
    }

    
    @GetMapping("/login")
    public String loginPage() {
        return "user_login";
    }

    
    @PostMapping("/login")
    public String loginUser(@RequestParam String username,
                            @RequestParam String password,
                            HttpSession session,
                            Model model) {

        User user = userService.loginUser(username, password);

        if (user == null) {
            model.addAttribute("error", "Invalid Username or Password");
            return "user_login";
        }

        session.setAttribute("userId", user.getUserId());
        session.setAttribute("username", user.getUsername());

        return "redirect:/user/home";
    }

    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
