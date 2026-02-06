package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.demo.model.Route;
import com.demo.repository.RouteRepository;

@Controller
public class RouteController {

    private RouteRepository routeRepo;

    public RouteController(RouteRepository routeRepo) {
        this.routeRepo = routeRepo;
    }

    @GetMapping("/routes")
    public String listRoutes(Model model) {
        model.addAttribute("routes", routeRepo.findAll());
        return "routes";
    }

    @GetMapping("/routes/new")
    public String showAddRouteForm(Model model) {
        model.addAttribute("route", new Route());
        return "create_route";
    }

    @PostMapping("/routes")
    public String saveRoute(@ModelAttribute("route") Route route) {
        routeRepo.save(route);
        return "redirect:/routes";
    }

    @GetMapping("/routes/edit/{id}")
    public String showUpdateRouteForm(@PathVariable Long id, Model model) {
        Route route = routeRepo.findById(id).orElse(null);
        model.addAttribute("route", route);
        return "update_route";
    }

    @PostMapping("/routes/{id}")
    public String updateRoute(@PathVariable Long id, @ModelAttribute("route") Route route) {
        Route existing = routeRepo.findById(id).orElse(null);
        existing.setRouteFrom(route.getRouteFrom());
        existing.setRouteTo(route.getRouteTo());
        existing.setDistance(route.getDistance());
        routeRepo.save(existing);
        return "redirect:/routes";
    }

    @GetMapping("/routes/delete/{id}")
    public String deleteRoute(@PathVariable Long id) {
        routeRepo.deleteById(id);
        return "redirect:/routes";
    }
}
