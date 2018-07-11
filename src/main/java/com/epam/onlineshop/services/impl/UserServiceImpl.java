package com.epam.onlineshop.services.impl;

import com.epam.onlineshop.entities.Role;
import com.epam.onlineshop.entities.User;
import com.epam.onlineshop.repository.UserRepository;
import com.epam.onlineshop.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Transactional
    @Override
    public boolean addUser(User user) {
        String username = user.getUsername();
        if (userRepository.findByUsername(username) != null) {
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
    public boolean isUserValidated(String password, String username) {
        return userRepository.findByUsernameAndPassword(username, password);
    }

    @Override
    public Role getRoleByUsername(String username) {
        return userRepository.findByUsername(username).getRole();
    }

    @Override
    public String signOutUser(User user) {
        User byUsername = userRepository.findByUsername(user.getUsername());
        return null;
    }
}
