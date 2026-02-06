package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.demo.model.Bus;
import com.demo.model.Route;
import com.demo.repository.BusRepository;
import com.demo.repository.RouteRepository;

@Controller
public class BusController {

    private BusRepository busRepo;
    private RouteRepository routeRepo;

    public BusController(BusRepository busRepo, RouteRepository routeRepo) {
        this.busRepo = busRepo;
        this.routeRepo = routeRepo;
    }

    @GetMapping("/buses")
    public String listBuses(Model model) {
        model.addAttribute("buses", busRepo.findAll());
        return "buses";
    }

    @GetMapping("/buses/new")
    public String showAddBusForm(Model model) {
        model.addAttribute("bus", new Bus());
        model.addAttribute("routes", routeRepo.findAll());
        return "create_bus";
    }

    @PostMapping("/buses")
    public String saveBus(@ModelAttribute("bus") Bus bus,
                          @RequestParam("routeId") Long routeId) {

        Route route = routeRepo.findById(routeId).orElse(null);
        bus.setRoute(route);

        bus.setAvailableSeats(bus.getSeats());

        busRepo.save(bus);
        return "redirect:/buses";
    }

    @GetMapping("/buses/edit/{id}")
    public String showUpdateBusForm(@PathVariable Long id, Model model) {
        model.addAttribute("bus", busRepo.findById(id).orElse(null));
        model.addAttribute("routes", routeRepo.findAll());
        return "update_bus";
    }

    @PostMapping("/buses/{id}")
    public String updateBus(@PathVariable Long id,
                            @ModelAttribute("bus") Bus bus,
                            @RequestParam("routeId") Long routeId) {

        Bus existing = busRepo.findById(id).orElse(null);

        if (existing == null) {
            return "redirect:/buses";
        }

        int oldTotalSeats = existing.getSeats();
        int oldAvailableSeats = existing.getAvailableSeats();

        existing.setBusName(bus.getBusName());
        existing.setDriverName(bus.getDriverName());
        existing.setBusType(bus.getBusType());
        existing.setArrivalTime(bus.getArrivalTime());
        existing.setDepartureTime(bus.getDepartureTime());
        existing.setPrice(bus.getPrice());

        existing.setRoute(routeRepo.findById(routeId).orElse(null));

        existing.setSeats(bus.getSeats());

        if (bus.getSeats() > oldTotalSeats) {
            int extra = bus.getSeats() - oldTotalSeats;
            existing.setAvailableSeats(oldAvailableSeats + extra);
        }

        if (existing.getAvailableSeats() > existing.getSeats()) {
            existing.setAvailableSeats(existing.getSeats());
        }

        busRepo.save(existing);
        return "redirect:/buses";
    }

    @GetMapping("/buses/delete/{id}")
    public String deleteBus(@PathVariable Long id) {
        busRepo.deleteById(id);
        return "redirect:/buses";
    }
}
