package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.model.Admin;
import com.demo.repository.AdminRepository;
import com.demo.repository.BusRepository;
import com.demo.repository.FeedbackRepository;
import com.demo.repository.RouteRepository;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminRepository repo;
	
	@Autowired
	private BusRepository busRepo;
	
	@Autowired
    private RouteRepository routeRepo;

    @Autowired
    private FeedbackRepository feedbackRepo;

	
	@Autowired
    public AdminServiceImpl(AdminRepository repo) {
        this.repo = repo;
    }

	@Override
    public Admin loginAdmin(String username, String password) {
        return repo.findByAdminUsernameAndAdminPassword(username, password)
                   .orElse(null);
    }

	@Override
	public int getBusCount() {
		return (int) busRepo.count();
	}

	@Override
	public int getRouteCount() {
		return (int) routeRepo.count();
	}

	@Override
	public int getFeedbackCount() {
		return (int) feedbackRepo.count();
	}

}
