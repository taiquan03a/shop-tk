package com.datn.sd43_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExceptionController {
    @GetMapping("/403")
    public String accessDenied() {
        return "Exception/403";
    }
}
