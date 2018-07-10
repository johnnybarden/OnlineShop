package com.epam.onlineshop.controllers;

import com.epam.onlineshop.entities.User;
import com.epam.onlineshop.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@RestController
public class UserController {
    @Autowired
    private UserService userService;


    @GetMapping("/session")
    public ModelAndView ifSessionExists(HttpSession session) {
        if(session.getAttribute("user") == null) {
            System.out.println("no session");
            session.setAttribute("user", new Object());
        } else {
            System.out.println("there is a session");
        }
        return new ModelAndView();
    }

    @PostMapping("/registration")
    public ModelAndView registerUser() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("newUser", new User());
        modelAndView.addObject(" registerErrorMessage", "hollou");
        modelAndView.setViewName("regist");
        return modelAndView;
    }

    @PostMapping("/signin")
    public ModelAndView signIn(@ModelAttribute("userJSP") User user) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(userService.signInUser(user));
        modelAndView.addObject("userJSP", user);
        return modelAndView;
    }

    /*@PostMapping("/signout")
    public ModelAndView signOut(@ModelAttribute("userJSP") User user) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(userService.signOutUser(user));
        //modelAndView.addObject("userJSP", user);
        return modelAndView;
    }*/

    @PostMapping("/user")
    public ModelAndView addNewUser(@ModelAttribute("userJSP") User user) {
        ModelAndView modelAndView = new ModelAndView();
        if (userService.addNewUser(user)) {
            modelAndView.setViewName("welcome");
            modelAndView.addObject("userJSP", user);
        } else {
            modelAndView.setViewName("regist");
            modelAndView.addObject("newUser", user);
            modelAndView.addObject("registerErrorMessage", "User with this login is already exists.");
        }
        return modelAndView;
    }
}