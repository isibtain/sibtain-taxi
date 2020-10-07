package com.bonvoyage.service;

import com.bonvoyage.domain.Trip;
import java.util.List;


/*
* Interface Trip, declaration of method to handle trip action
* @author  John Styves Vallon
* @version 1.0
* @since   2019-11-19
*
* */

public interface TripService {
	public void saveTripe(Trip trip);
	//public List<Trip> findTripByOriginAndDest(String origin, String destination);
	public List<Trip> findTripByOriginAndDest(String origin);

	public List<Trip> listTripByLocalisation(String origin, String destination);
	public List<Trip> lastTenTrip();
	public List<Trip>  findByUserId(long id);

	public List<Trip> AllTrip();

	public Trip findTripById(Long tripId);
}
