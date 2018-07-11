package com.epam.onlineshop.services;

import com.epam.onlineshop.entities.Role;
import com.epam.onlineshop.entities.User;

public interface UserService {

    boolean addUser(User user);

    boolean isUserValidated(String password, String username);

    Role getRoleByUsername(String username);
}
