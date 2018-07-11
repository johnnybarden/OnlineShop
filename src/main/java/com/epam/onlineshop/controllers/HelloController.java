package com.epam.onlineshop.controllers;

import org.springframework.stereotype.Controller;

import com.epam.onlineshop.entities.User;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
public class HelloController {

    @GetMapping("/")
    public String main(Map<String, Object> model, HttpSession session) {

        User sessionUser = (User) session.getAttribute("user");

        if(sessionUser != null) { ;
            model.put("userJSP", sessionUser);
            model.put("message", "");
            return "welcome";
        } else {
            model.put("userJSP", new User());
            model.put("message", "");
            return "index";
        }

    }
}
