package com.epam.onlineshop.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class CartController {

    @GetMapping("/cart")
    public String main(Map<String, Object> model) {
        return "cart";
    }
}
