package com.bonvoyage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.bonvoyage.domain.Search;
import com.bonvoyage.domain.Trip;
import com.bonvoyage.service.TripService;



@Controller
public class HomeController {


	@Autowired
	private TripService tripService;

//  	@ModelAttribute("listLastTentrip")
//
//  	public List<Trip> getList(){
//  	  return tripService.lastTenTrip();
//  	}


	@RequestMapping({"/","/welcome"})
	public String welcome(@ModelAttribute("searchTrip") Search search, Model model) {

		ObjectMapper mapper = new ObjectMapper();

		List<Trip> listTrip = tripService.lastTenTrip();

		String trips = null;

		try {
			trips = mapper.writeValueAsString( listTrip);
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


		model.addAttribute("listLastTentrip",tripService.lastTenTrip());
		model.addAttribute("listLastTentripjs",trips);
		return "/welcome";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@ModelAttribute("searchTrip") Search search,Model model) {
		return "search";
	}



	@RequestMapping(value="/search_Trip", method = RequestMethod.POST)
	public String search(@Valid @ModelAttribute("searchTrip") Search search, BindingResult bindingResult, RedirectAttributes redirectAttributes,Model model) {

		if(bindingResult.hasErrors()) {
			return "/welcome";
		}



		System.out.println("Origin "+search.getOrigin_search());
		System.out.println("Destination "+search.getDestination_search());
		ObjectMapper mapper = new ObjectMapper();

		List<Trip> listTrip = tripService.findTripByOriginAndDest(search.getOrigin_search());

		String trips = null;

		try {
			trips = mapper.writeValueAsString( listTrip);
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

		redirectAttributes.addFlashAttribute("listSearchtrip",tripService.findTripByOriginAndDest(search.getOrigin_search()));
		//model.addAttribute("listLastTentrip",tripService.findTripByOriginAndDest(search.getOrigin_search());
		redirectAttributes.addFlashAttribute("listSearchtripjs",trips);

		//redirectAttributes.addFlashAttribute("listSearchtrip",tripService.lastTenTrip());
		//redirectAttributes.addFlashAttribute("listSearchtripjs",trips);
		return "redirect:/search";
	}

	@GetMapping(value="/about")
	public String about() {
		return "/whoWeAre";
	}




}