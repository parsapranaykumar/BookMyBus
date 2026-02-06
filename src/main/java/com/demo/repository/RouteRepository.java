package com.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.demo.model.Route;

@Repository
public interface RouteRepository extends JpaRepository<Route, Long> {

}
