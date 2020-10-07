package com.bonvoyage.service;

import com.bonvoyage.domain.Review;
import com.bonvoyage.domain.Trip;

import java.util.List;


/*
* @author  Asad Ali Kanwal
* @version 1.0
* @since   2019-11-19
*
* */

public interface ReviewService {
	public void save(Review review);
	public Review findReviewById(Long reviewId);
}
