package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.exception.ResourceNotFoundException;
import com.demo.model.Bus;
import com.demo.repository.BusRepository;

@Service
public class BusServiceImpl implements BusService{
	
	@Autowired
	private BusRepository busrepo;
	
	@Autowired
    public BusServiceImpl(BusRepository busrepo) {
        this.busrepo = busrepo;
    }

	@Override
	public Bus saveBus(Bus bus) {
		return busrepo.save(bus);
	}

	@Override
	public Bus updateBus(Bus bus) {
		return busrepo.save(bus);
	}

	@Override
	public Bus getBusById(Long id) {
		return busrepo.findById(id)
			    .orElseThrow(() -> new ResourceNotFoundException("Bus not found with id: " + id));
	}

	@Override
	public List<Bus> getAllBuses() {
		return busrepo.findAll();
	}

	@Override
	public void deleteBus(Long id) {
		busrepo.deleteById(id);
	}

	@Override
	public List<Bus> searchBuses(String from, String to) {
		return busrepo.findByRoute_RouteFromAndRoute_RouteTo(from, to);
    }

}
