package com.datn.sd43_datn.controller;


import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
    @GetMapping("/signin")
    public String getSigninPage(@RequestParam(required = false) String error, Model model) {
        if (error != null) {
            String message = "Invalid username or password";
            model.addAttribute("message", message);
        }
        return "Auth/signin";
    }
}
