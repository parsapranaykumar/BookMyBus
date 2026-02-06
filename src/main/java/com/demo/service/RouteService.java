package com.demo.service;

import java.util.List;

import com.demo.model.Route;

public interface RouteService {
	
	Route saveRoute(Route route);
	
	Route updateRoute(Route route);
	
    Route getRouteById(Long id);
    
    List<Route> getAllRoutes();
    
    void deleteRoute(Long id);

}
