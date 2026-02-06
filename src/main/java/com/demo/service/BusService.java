package com.demo.service;

import java.util.List;

import com.demo.model.Bus;

public interface BusService {
	
	Bus saveBus(Bus bus);
	
	Bus updateBus(Bus bus);
	
    Bus getBusById(Long id);
    
    List<Bus> getAllBuses();
    
    void deleteBus(Long id);

    List<Bus> searchBuses(String from, String to);

}
