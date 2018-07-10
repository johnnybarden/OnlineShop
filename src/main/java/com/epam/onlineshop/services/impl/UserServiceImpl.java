package com.epam.onlineshop.services.impl;

import com.epam.onlineshop.entities.Role;
import com.epam.onlineshop.entities.User;
import com.epam.onlineshop.repository.UserRepository;
import com.epam.onlineshop.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Transactional
    @Override
    public boolean addNewUser(User user) {

        String username = user.getUsername();
        if (null != userRepository.findByUsername(username)) {
                return false;
        } else {
            userRepository.save(User.builder()
                    .role(Role.USER)
                    .username(username)
                    .isBlocked(false)
                    .password(user.getPassword())
                    .address(user.getAddress())
                    .build());
            return true;
        }
    }

    @Override
    public String signInUser(User user) {
        User byUsername = userRepository.findByUsername(user.getUsername());
        if ((byUsername != null) && ((byUsername.getPassword().equals(user.getPassword())))) {
            return "welcome";
        } else {
            return "wrong_enter";
        }
    }

    @Override
    public String signOutUser(User user) {
        User byUsername = userRepository.findByUsername(user.getUsername());
        return null;
    }
}
