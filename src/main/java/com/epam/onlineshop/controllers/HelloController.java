package com.epam.onlineshop.controllers;

import org.springframework.stereotype.Controller;

import com.epam.onlineshop.entities.User;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.Map;

@Controller
public class HelloController {

    @GetMapping("/")
    public String main(Map<String, Object> model) {
        model.put("userJSP", new User());
        model.put("message", "");
        return "index";
    }
}
