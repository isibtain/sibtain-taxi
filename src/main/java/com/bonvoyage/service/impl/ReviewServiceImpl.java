package com.bonvoyage.service.impl;

import com.bonvoyage.domain.Review;
import com.bonvoyage.domain.Trip;
import com.bonvoyage.repository.ReviewRepository;
import com.bonvoyage.repository.TripRepository;
import com.bonvoyage.service.ReviewService;
import com.bonvoyage.service.TripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/*
 * @author  Asad Ali Kanwal
 * @version 1.0
 * @since   2019-11-19
 *
 * */

@Service
@Transactional 
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewRepository reviewRepository;

	@Override
	@PreAuthorize("hasAnyRole('DRIVER', 'RIDER', 'ADMIN')")
	public void save(Review review) {
		reviewRepository.save(review);
	}

	@Override
	@PreAuthorize("hasAnyRole('DRIVER', 'RIDER', 'ADMIN')")
	public Review findReviewById(Long reviewId) {
		return reviewRepository.findOne(reviewId);
	}
}
