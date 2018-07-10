package com.epam.onlineshop.services;

import com.epam.onlineshop.entities.User;

public interface UserService {

    boolean addNewUser(User user);
    String signInUser(User user);
    String signOutUser(User user);
}
