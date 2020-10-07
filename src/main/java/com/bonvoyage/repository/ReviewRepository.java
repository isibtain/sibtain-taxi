package com.bonvoyage.repository;

import com.bonvoyage.domain.Review;
import com.bonvoyage.domain.Trip;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/*
* @author  Asad Ali Kanwal
* @version 1.0
* @since   2019-11-19
*
* */

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long>  {

}
