package com.bonvoyage.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.bonvoyage.domain.Trip;

import java.awt.print.Pageable;
import java.util.List;

/*
* Interface Trip, declaration of method to handle trip action
* @author  John Styves Vallon
* @version 1.0
* @since   2019-11-19
*
* */

@Repository
public interface TripRepository extends CrudRepository<Trip, Long>  {

    @Query("select t from Trip t")
    List<Trip> lastTenTrip();

    @Query("select u from Trip u where u.driver.id = :user_id")
    List<Trip> findByUserId(@Param("user_id") long user_id);


    @Query("SELECT t FROM Trip t WHERE t.origin LIKE ?1")
    List<Trip> findTripByOriginAndDest(String origin);

}
