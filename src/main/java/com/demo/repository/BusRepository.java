package com.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.demo.model.Bus;

@Repository
public interface BusRepository extends JpaRepository<Bus, Long>{

	List<Bus> findByRoute_RouteFromAndRoute_RouteTo(String from, String to);

}
