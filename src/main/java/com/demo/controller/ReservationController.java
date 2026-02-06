package com.demo.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.demo.model.Bus;
import com.demo.model.Reservation;
import com.demo.model.User;
import com.demo.service.BusService;
import com.demo.service.ReservationService;
import com.demo.service.UserService;
import com.demo.exception.ResourceNotFoundException;
import com.demo.repository.ReservationRepository;



import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {

    private BusService busService;
    private ReservationService reservationService;
    private UserService userService;
    
    @Autowired
    private ReservationRepository resRepo;


    public ReservationController(BusService busService,
                                 ReservationService reservationService,
                                 UserService userService) {
        this.busService = busService;
        this.reservationService = reservationService;
        this.userService = userService;
    }

    // ✅ 1) Search page (optional)
    @GetMapping("/search")
    public String searchPage() {
        return "search_bus";
    }

    // ✅ 2) Search Result (From Home Page)
    @PostMapping("/search")
    public String searchResult(@RequestParam String from,
                               @RequestParam String to,
                               Model model) {

        model.addAttribute("buses", busService.searchBuses(from, to));
        model.addAttribute("from", from);
        model.addAttribute("to", to);
        return "bus_results";
    }

    // ✅ 3) Book page
    @GetMapping("/book/{busId}")
    public String bookForm(@PathVariable Long busId, Model model, HttpSession session) {

        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/user/login";

        Bus bus = busService.getBusById(busId);
        model.addAttribute("bus", bus);

        return "book_ticket";
    }

    // ✅ 4) Book submit -> reservation PENDING -> go payment page
    @PostMapping("/book")
    public String bookTicket(@RequestParam Long busId,
                             @RequestParam int seatsRequested,
                             HttpSession session,
                             Model model) {

        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/user/login";

        Bus bus = busService.getBusById(busId);
        User user = userService.getUserById(userId);

        if (seatsRequested <= 0) {
            model.addAttribute("bus", bus);
            model.addAttribute("error", "Invalid seat count!");
            return "book_ticket";
        }

        if (seatsRequested > bus.getAvailableSeats()) {
            model.addAttribute("bus", bus);
            model.addAttribute("error", "Seats not available!");
            return "book_ticket";
        }

        // ✅ Hold seats
        bus.setAvailableSeats(bus.getAvailableSeats() - seatsRequested);
        busService.updateBus(bus);

        // ✅ Create reservation
        Reservation r = new Reservation();
        r.setBus(bus);
        r.setUser(user);
        r.setSeatsRequested(seatsRequested);
        r.setSource(bus.getRoute().getRouteFrom());
        r.setDestination(bus.getRoute().getRouteTo());

        r.setReservationStatus("PENDING");
        r.setReservationType("ONLINE");
        r.setReservationDate(LocalDate.now());
        r.setReservationTime(bus.getDepartureTime());

        r.setJourneyStarted(false);
        r.setJourneyEnded(false);

        Reservation saved = reservationService.saveReservation(r);

        return "redirect:/payment/" + saved.getReservationId();
    }

    // ✅ 5) Payment page
    @GetMapping("/payment/{reservationId}")
    public String paymentPage(@PathVariable Long reservationId,
                              Model model,
                              HttpSession session) {

        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/user/login";

        Reservation r = reservationService.getReservationById(reservationId);
        model.addAttribute("reservation", r);

        return "payment";
    }

    // ✅ 6) Pay now confirm -> CONFIRMED
    @PostMapping("/payment/confirm")
    public String confirmPayment(@RequestParam Long reservationId,
                                 HttpSession session) {

        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/user/login";

        Reservation r = reservationService.getReservationById(reservationId);
        r.setReservationStatus("CONFIRMED");
        reservationService.updateReservation(r);

        return "redirect:/myreservations";
    }

    // ✅ 7) My Reservations
    @GetMapping("/myreservations")
    public String myReservations(HttpSession session, Model model) {

        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/user/login";

        model.addAttribute("reservations", reservationService.getReservationsByUserId(userId));
        return "user_reservations";
    }
    
    
    @GetMapping("/journey/start/{id}")
    public String startJourney(@PathVariable Long id) {

        Reservation r = resRepo.findById(id)
            .orElseThrow(() -> new ResourceNotFoundException("Reservation not found with id: " + id));

        if ("CONFIRMED".equals(r.getReservationStatus())) {
            r.setJourneyStarted(true);
            resRepo.save(r);
        }

        return "redirect:/myreservations";
    }


    @GetMapping("/journey/end/{id}")
    public String endJourney(@PathVariable Long id) {

        Reservation r = resRepo.findById(id)
            .orElseThrow(() -> new ResourceNotFoundException("Reservation not found with id: " + id));

        if ("CONFIRMED".equals(r.getReservationStatus())) {
            r.setJourneyEnded(true);
            resRepo.save(r);
        }

        return "redirect:/myreservations";
    }


}
