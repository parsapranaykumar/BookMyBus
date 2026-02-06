package com.demo.service;

import java.util.List;

import com.demo.model.Reservation;

public interface ReservationService {
	
	Reservation saveReservation(Reservation reservation);
    Reservation updateReservation(Reservation reservation);

    Reservation getReservationById(Long id);
    List<Reservation> getAllReservations();

    List<Reservation> getReservationsByUserId(Long userId);

    void deleteReservation(Long id);

}
