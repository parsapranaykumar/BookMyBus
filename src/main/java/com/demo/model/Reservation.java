package com.demo.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long reservationId;
	private String reservationStatus;
	private String reservationType;
	private LocalDate reservationDate;
	private String reservationTime;
	private String source;
	private String destination;
	private int seatsRequested;
	private boolean journeyStarted;
	private boolean journeyEnded;
	
	@ManyToOne
	@JoinColumn(name="bus_id")
	private Bus bus;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;

	public Long getReservationId() {
		return reservationId;
	}

	public void setReservationId(Long reservationId) {
		this.reservationId = reservationId;
	}

	public String getReservationStatus() {
		return reservationStatus;
	}

	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}

	public String getReservationType() {
		return reservationType;
	}

	public void setReservationType(String reservationType) {
		this.reservationType = reservationType;
	}

	public LocalDate getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(LocalDate reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getReservationTime() {
		return reservationTime;
	}

	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public int getSeatsRequested() {
		return seatsRequested;
	}

	public void setSeatsRequested(int seatsRequested) {
		this.seatsRequested = seatsRequested;
	}

	public boolean isJourneyStarted() {
		return journeyStarted;
	}

	public void setJourneyStarted(boolean journeyStarted) {
		this.journeyStarted = journeyStarted;
	}

	public boolean isJourneyEnded() {
		return journeyEnded;
	}

	public void setJourneyEnded(boolean journeyEnded) {
		this.journeyEnded = journeyEnded;
	}

	public Bus getBus() {
		return bus;
	}

	public void setBus(Bus bus) {
		this.bus = bus;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	

}
