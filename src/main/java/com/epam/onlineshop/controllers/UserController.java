package com.epam.onlineshop.controllers;

import lombok.RequiredArgsConstructor;
import com.epam.onlineshop.entities.Role;
import com.epam.onlineshop.entities.User;
import com.epam.onlineshop.services.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    private final static String WRONG_SIGNIN = "Username or Password is wrong!";
    private final static String WRONG_SIGNUP = "This username is already exist!";

    @GetMapping(value = "/registration")
    public ModelAndView registration(ModelAndView model) {
        model.addObject("newUser", new User());
        model.setViewName("registration");
        return model;
    }

    @PostMapping(value = "/registration")
    public ModelAndView addUser(@ModelAttribute("userJSP") User user, ModelAndView model) {
        if (userService.addUser(user)) {
            model.setViewName("welcome");
            model.addObject("userJSP", user);
        } else {
            model.setViewName("registration");
            model.addObject("newUser", user);
            model.addObject("registerErrorMessage", WRONG_SIGNUP);
        }
        return model;
    }

    @PostMapping("/login")
    public ModelAndView login(@ModelAttribute("userJSP") User user, ModelAndView model) {
        if (userService.isUserValidated(user.getPassword(), user.getUsername())) {
            model.setViewName(getViewNameByRole(userService.getRoleByUsername(user.getUsername())));
            model.addObject("userJSP", user);
        } else {
            model.setViewName("index");
            model.addObject("message", WRONG_SIGNIN);
        }
        return model;
    }

    String getViewNameByRole(Role userRole) {
        switch (userRole) {
            case USER:
                return "welcome";
            case ADMIN:
                return "admin";
            case ANONYMOUS:
                return "welcome";
            default:
                return "welcome";
        }
    }
}