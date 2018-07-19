package com.epam.onlineshop.controllers;

import com.epam.onlineshop.entities.Role;
import com.epam.onlineshop.entities.User;
import com.epam.onlineshop.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import com.epam.onlineshop.entities.Product;
import com.epam.onlineshop.services.ProductService;
import org.apache.log4j.Logger;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequiredArgsConstructor
public class HelloController {
    private final ProductService productService;
    private final static Logger logger = Logger.getLogger(HelloController.class);

    private final UserService userService;

    @GetMapping({"/","/welcome"})
    public ModelAndView main() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User loggedInUser = userService.findByUsername(username);

        String viewName = getViewName(loggedInUser.getRole());
        ModelAndView modelAndView = new ModelAndView(viewName);

        modelAndView.addObject(productService.getAllProducts());
        modelAndView.addObject("product", new Product());

        return modelAndView;
    }

    @GetMapping("/deny-access")
    public ModelAndView denyAccess() {
        return new ModelAndView("access_denied");
    }

    private String getViewName(Role role) {
        switch (role) {
            case ADMIN:
                return "redirect:/users";
            default:
                return "main";
        }
    }
}

