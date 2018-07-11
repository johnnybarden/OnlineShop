package com.epam.onlineshop.controllers;

import org.springframework.stereotype.Controller;

import com.epam.onlineshop.entities.User;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;



@Controller
public class HelloController {

    @GetMapping({"/","/welcome"})
    public String main(Map<String, Object> model, User user, HttpSession session) {
        user = (User) session.getAttribute("user");
        if(session.getAttribute("user") == null) {
            model.put("userJSP", new User());
            model.put("message", "");
            return "main";
        } else {
            session.setAttribute("user", user);
            return "welcome";
        }
    }
    @GetMapping("/login")
    public String login(Map<String, Object> model) {
        return "login";
    }
}
