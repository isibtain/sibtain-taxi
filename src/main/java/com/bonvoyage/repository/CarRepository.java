package com.bonvoyage.repository;

import com.bonvoyage.domain.Car;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Class to hold address data.
 *
 * @author Ali M Ahmadi
 * @author amahmadi@mum.edu
 * @version 1.0
 * @since 1.0
 */
@Repository
public interface CarRepository extends CrudRepository<Car, Long> {

}
