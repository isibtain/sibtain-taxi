package com.bonvoyage.controller;

import com.bonvoyage.domain.Car;
import com.bonvoyage.domain.Driver;

import com.bonvoyage.domain.User;
import com.bonvoyage.service.CarService;
import com.bonvoyage.service.DriverService;
import com.bonvoyage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.security.Principal;
/**
 * Class to hold address data.
 *
 * @author Ali M Ahmadi
 * @author amahmadi@mum.edu
 * @version 1.0
 * @since 1.0
 */
@Controller
public class DriverController {

    @Autowired
    DriverService driverService;

    @Autowired
    CarService carService;

    @Autowired
    UserService userService;


    @RequestMapping(value = "/registerDriver", method = RequestMethod.GET)
    public String registerDriver(@ModelAttribute("newDriver") Driver newDriver) {
        return "/driverRegistration";
    }

    @RequestMapping(value = "/registerDriver", method = RequestMethod.POST)
    public String saveDriver(@Valid @ModelAttribute("newDriver") Driver newDriver, BindingResult result, RedirectAttributes redirectAttributes, Principal principal) {
        if (result.hasErrors()) {
            return "/driverRegistration";
        }
//        Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name = principal.getName();
        User user = userService.findUserByUsername(name);
        newDriver.setUser(user);
        driverService.save(newDriver);

        redirectAttributes.addFlashAttribute("newDriver", newDriver);
        return "redirect:/driverRegistered";
    }

    @RequestMapping(value = "/driverRegistered", method = RequestMethod.GET)
    public String showSuccessRegistration() {

        return "/driverRegistered";
    }


}
