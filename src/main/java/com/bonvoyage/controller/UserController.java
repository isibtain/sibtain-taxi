package com.bonvoyage.controller;
/**
 * @author Aser Ahmad
 * @author aaahmad@mum.edu
 *  * @version 1.0
 *  * @since 1.0
 *
 */
import com.bonvoyage.domain.User;
import com.bonvoyage.domain.UserRole;
import com.bonvoyage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/users")
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping(value = "/signup")
    public String startSignupProcess(@ModelAttribute("newUser") User user) {
        return "/signup";
    }

    @PostMapping(value = "/signup")
    public String createUser(@Valid @ModelAttribute("newUser") User userToCreate, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors())
            return "/signup";
        userToCreate.setUserRole(UserRole.ROLE_NONE);
        userToCreate.setEnabled(true);
        userService.saveUser(userToCreate);
        redirectAttributes.addFlashAttribute("savedUser", userToCreate);
        return "redirect:/users/success";
    }

    @GetMapping(value = "/success")
    public String showCreatedUser() {
        return "/userDetails";
    }

    @GetMapping(value = "/nonApproved")
    public String getNonApprovedUsers(Model model) {
        model.addAttribute("listOfUsers", userService.findUsersByRole(UserRole.ROLE_NONE));
        return "/awaitingApproval";
    }
}
