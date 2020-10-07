package com.bonvoyage.service.impl;

import java.awt.print.Pageable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bonvoyage.domain.Trip;
import com.bonvoyage.repository.TripRepository;
import com.bonvoyage.service.TripService;

/*
 * TripServiceImpl, Implementation of method to handle trip action
 * @author  John Styves Vallon
 * @version 1.0
 * @since   2019-11-19
 *
 * */

@Service
@Transactional
public class TripServiceImpl implements TripService {



	@Autowired
	TripRepository tripRepository;

	@Override
	public void saveTripe(Trip trip) {
		tripRepository.save(trip);
	}

	@Override
	public List<Trip> findTripByOriginAndDest(String origin) {

		List<Trip> listD = tripRepository.findTripByOriginAndDest("%Miami%");

		System.out.println("Size Past "+listD.size());

		return  listD;
	}

//	@Override
//	public List<Trip> findTripByOriginAndDest(String origin, String destination) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public List<Trip> listTripByLocalisation(String origin, String destination) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Trip findTripById(Long tripId) {
		return tripRepository.findOne(tripId);
	}

	@Override
	public List<Trip> lastTenTrip() {
		// List<Trip> lastTenTrip(Pageable pageable);
		return tripRepository.lastTenTrip();
	}

	@Override
	public List<Trip> findByUserId(long id) {
		return (List<Trip>)tripRepository.findByUserId(id);
	}

	@Override
	public List<Trip> AllTrip() {
		return  (List<Trip>)tripRepository.findAll();
	}

}