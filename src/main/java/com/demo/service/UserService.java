package com.demo.service;

import java.util.List;
import com.demo.model.User;

public interface UserService {

    User registerUser(User user);

    User loginUser(String username, String password);

    User getUserById(Long id);

    List<User> getAllUsers();
}
