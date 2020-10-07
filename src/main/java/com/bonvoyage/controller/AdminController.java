package com.bonvoyage.controller;

import com.bonvoyage.domain.User;
import com.bonvoyage.domain.UserRole;
import com.bonvoyage.repository.UserRepository;
import com.bonvoyage.service.DriverService;
import com.bonvoyage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    UserService userService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    DriverService driverService;

    @GetMapping(value = "/approval")
    public String adminApproval(@ModelAttribute("user") User user, Model model) {
        System.out.println("Users" + driverService.findUsersByRole(false));
        model.addAttribute("usersRider", userService.findUsersByRole(UserRole.ROLE_NONE));
        model.addAttribute("usersDriver", driverService.findUsersByRole(false));
        return "/admin";
    }

//    @PostMapping(value = "/approval")
//    public String createUser(@Valid @ModelAttribute("user") User user, BindingResult result, RedirectAttributes redirectAttributes) {
//        if (result.hasErrors())
//            return "approval";
//
////        userService.saveUser(userToCreate);
////        redirectAttributes.addFlashAttribute("savedUser", userToCreate);
//        return "admin";
//    }

    //    @ResponseStatus(value = HttpStatus.NO_CONTENT)


}
