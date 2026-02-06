package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.exception.ResourceNotFoundException;
import com.demo.model.Route;
import com.demo.repository.RouteRepository;

@Service
public class RouteServiceImpl implements RouteService {
	
	@Autowired
	private RouteRepository repo;
	
	@Autowired
    public RouteServiceImpl(RouteRepository repo) {
        this.repo = repo;
    }

	@Override
	public Route saveRoute(Route route) {
		return repo.save(route);
	}

	@Override
	public Route updateRoute(Route route) {
		return repo.save(route);
	}

	@Override
	public Route getRouteById(Long id) {
		return repo.findById(id)
			    .orElseThrow(() -> new ResourceNotFoundException("Route not found with id: " + id));
	}

	@Override
	public List<Route> getAllRoutes() {
		return repo.findAll();
	}

	@Override
	public void deleteRoute(Long id) {
		repo.deleteById(id);
	}

}
