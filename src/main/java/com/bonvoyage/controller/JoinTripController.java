package com.bonvoyage.controller;

import com.bonvoyage.domain.Trip;
import com.bonvoyage.domain.User;
import com.bonvoyage.service.TripService;
import com.bonvoyage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.Set;

@Controller
public class JoinTripController {
    @Autowired
    TripService tripService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/joinTrip", method = RequestMethod.GET)
    public String joinTrip(@RequestParam("tripId")String tripId, Principal principal){
        String username = principal.getName();
        User user = userService.findUserByUsername(username);
        Long id= Long.parseLong(tripId);
        Trip trip = tripService.findTripById(id);
        trip.getPassengers().add(user);
        tripService.saveTripe(trip);
        return "redirect:/welcome";
    }
}
