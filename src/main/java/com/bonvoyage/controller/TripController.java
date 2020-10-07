package com.bonvoyage.controller;



import com.bonvoyage.domain.User;
import com.bonvoyage.service.UserService;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.bonvoyage.domain.Search;
import com.bonvoyage.domain.Trip;
import com.bonvoyage.service.TripService;
import java.io.IOException;
import java.security.Principal;
import java.util.List;




/*
 * The Trip Controller Handle All the Task for the Trip.
 * @author  John Styves Vallon
 * @version 1.0
 * @since   2019-11-18
 *
 * */

@Controller
public class TripController {

    @Autowired
    TripService tripService;

    @Autowired
    UserService userService;

    /**
     * Serve the Seach Page
     * GET Method
     */

    /**
     * Serve the map page Get Method
     */

     @ModelAttribute("user_id")
     private Long getId(Principal principal){
         String name = principal.getName();
         User user   = userService.findUserByUsername(name);
         return user.getId();
     }


    @ModelAttribute("singleUser")
    private User getSingleUser(Principal principal){
        String name = principal.getName();
        return userService.findUserByUsername(name);
    }


    @RequestMapping(value = "/addTrip", method = RequestMethod.GET)
    public String home(@ModelAttribute("newTrip") Trip trip,Model model) {
        return "/map";
    }

    @RequestMapping(value = "/addTrip", method = RequestMethod.POST)
    public String addTrip(@ModelAttribute("newTrip") Trip newTrip, Model model, Principal principal) {

        newTrip.setStatus("posted");
        String name = principal.getName();
        User user   = userService.findUserByUsername(name);
        newTrip.addPassenger(user);
        tripService.saveTripe(newTrip);
        return "redirect:/driver_Trip";
    }

    @RequestMapping(value = "/driver_Trip", method = RequestMethod.GET)
    public String search(@ModelAttribute("searchTrip") Search search,Model model) {

        ObjectMapper mapper = new ObjectMapper();
        List<Trip> listTrip = tripService.findByUserId(2);

        String trips = null;
        try {
            trips = mapper.writeValueAsString(listTrip);
        } catch (JsonGenerationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (JsonMappingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        model.addAttribute("listCurrentUserTripjs",trips);
        model.addAttribute("listCurrentUserTrip",tripService.findByUserId(2));
        return "/driver_trip";
    }



    @RequestMapping(value="/updateTrip", method = RequestMethod.POST)
    public @ResponseBody Trip updateTrip(@RequestBody Trip trip){
//         System.out.println("If i am Reach you");
        return trip;
    }



}