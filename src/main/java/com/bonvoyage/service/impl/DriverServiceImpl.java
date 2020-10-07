package com.bonvoyage.service.impl;

import com.bonvoyage.domain.Driver;
import com.bonvoyage.repository.DriverRepository;
import com.bonvoyage.service.DriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
/**
 * Class to hold address data.
 *
 * @author Ali M Ahmadi
 * @author amahmadi@mum.edu
 * @version 1.0
 * @since 1.0
 */
@Service
@Transactional
public class DriverServiceImpl implements DriverService {

    @Autowired
    DriverRepository driverRepository;

//    public String verify(Driver driver){
//
//        if(driver.getDrivingLicenseNo().equals("") || driver.getDrivingExpirationDate()==null ){
//            return "false";
//        }else{
//            return "true";
//        }
//
//    }

    public void save(Driver driver){

        driverRepository.save(driver);
    }


    public Driver findOne(Long id){
        return driverRepository.findOne(id);
    }

    @Override
    public void setCarId(int id, int carId) {
//        driverRepository.setCarId(id, carId);
    }

    @Override
    public List<Driver> findUsersByRole(Boolean isDriverApproved) {
        return driverRepository.findUsersByRole(isDriverApproved);
    }



}
