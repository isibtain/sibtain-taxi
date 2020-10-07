package com.bonvoyage.controller;

import com.bonvoyage.domain.User;
import com.bonvoyage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @GetMapping(value = "/login")
    public String showLogin(@ModelAttribute("user") User user) {
        return "/login";
    }

    @GetMapping(value="/loginfailed")
    public String loginerror(Model model) {
        model.addAttribute("error", "true");
        return "/login";
    }

    @GetMapping(value="/logout")
    public String logout(Model model) {
        return "redirect:/welcome";
    }
}