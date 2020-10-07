package com.bonvoyage.service;

import com.bonvoyage.domain.Driver;
import com.bonvoyage.domain.User;
import com.bonvoyage.domain.UserRole;

import java.util.List;
/**
 * Class to hold address data.
 *
 * @author Ali M Ahmadi
 * @author amahmadi@mum.edu
 * @version 1.0
 * @since 1.0
 */
public interface DriverService {

//    public String verify(Driver driver);

    public void save(Driver driver);
    public Driver findOne(Long id);
    public void setCarId(int id, int carId);

    List<Driver> findUsersByRole(Boolean isDriverApproved);
}
