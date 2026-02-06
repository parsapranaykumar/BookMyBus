package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.exception.ResourceNotFoundException;
import com.demo.model.Reservation;
import com.demo.repository.ReservationRepository;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationRepository repo;
	
	@Autowired
    public ReservationServiceImpl(ReservationRepository repo) {
        this.repo = repo;
    }

	@Override
	public Reservation saveReservation(Reservation reservation) {
		return repo.save(reservation);
	}

	@Override
	public Reservation updateReservation(Reservation reservation) {
		return repo.save(reservation);
	}

	@Override
	public Reservation getReservationById(Long id) {
		return repo.findById(id)
			    .orElseThrow(() -> new ResourceNotFoundException("Reservation not found with id: " + id));
	}

	@Override
	public List<Reservation> getAllReservations() {
		return repo.findAll();
	}

	@Override
	public List<Reservation> getReservationsByUserId(Long userId) {
		return repo.findByUser_UserId(userId);
	}

	@Override
	public void deleteReservation(Long id) {
		repo.deleteById(id);
	}

}
