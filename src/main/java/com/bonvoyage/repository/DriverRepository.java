package com.bonvoyage.repository;

import com.bonvoyage.domain.Driver;
import com.bonvoyage.domain.User;
import com.bonvoyage.domain.UserRole;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
/**
 * Class to hold address data.
 *
 * @author Ali M Ahmadi
 * @author amahmadi@mum.edu
 * @version 1.0
 * @since 1.0
 */
@Repository
public interface DriverRepository extends CrudRepository<Driver, Long> {
//    @Query("update Driver d set d.car_id = :carId where d.id = :id ")
//    public void setCarId(@Param("id") int id, @Param("carId") int carId);

    String USERS_BY_ROLE = "select u from Driver u where u.isDriverApproved = :isDriverApproved";

    @Query(value = USERS_BY_ROLE)
    List<Driver> findUsersByRole(@Param("isDriverApproved") Boolean isDriverApproved);
}
