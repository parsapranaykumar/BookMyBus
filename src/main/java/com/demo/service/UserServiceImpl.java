package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.exception.ResourceNotFoundException;
import com.demo.model.User;
import com.demo.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository repo;
	
	@Autowired
    public UserServiceImpl(UserRepository repo) {
        this.repo = repo;
    }
    
	@Override
	public User registerUser(User user) {
		return repo.save(user);
	}

	@Override
	public User loginUser(String username, String password) {
		return repo.findByUsernameAndPassword(username, password).orElse(null);

	}


	@Override
	public User getUserById(Long id) {
		return repo.findById(id)
			    .orElseThrow(() -> new ResourceNotFoundException("User not found with id: " + id));
	}

	@Override
	public List<User> getAllUsers() {
		return repo.findAll();
	}
	

}
