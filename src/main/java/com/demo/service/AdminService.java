package com.demo.service;

import com.demo.model.Admin;

public interface AdminService {
	
    Admin loginAdmin(String username, String password);
    
    int getBusCount();
    int getRouteCount();
    int getFeedbackCount();
}