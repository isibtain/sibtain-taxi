package com.bonvoyage.controller;

import com.bonvoyage.domain.Review;
import com.bonvoyage.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

/*
 * @author  Asad Ali Kanwal
 * @version 1.0
 * @since   2019-11-19
 *
 * */

@Controller
public class ReviewController {

    @Autowired
    ReviewRepository reviewRepository;


    @RequestMapping(value="/review", method = RequestMethod.GET)
    public String showReview(@ModelAttribute("review") Review review){
        System.out.print("________Inside Review GET_________");
        return "/review";
    }


    @RequestMapping(value="/review", method = RequestMethod.POST)
    public String addReview(@Valid @ModelAttribute("review") Review review, BindingResult result){
        System.out.print("________Inside Review POST _________");
        reviewRepository.save(review);
        return "/review";
    }
}
