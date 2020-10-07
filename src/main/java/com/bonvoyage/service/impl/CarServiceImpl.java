package com.bonvoyage.service.impl;

import com.bonvoyage.domain.Car;
import com.bonvoyage.repository.CarRepository;
import com.bonvoyage.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
public class CarServiceImpl implements CarService {
    @Autowired
    CarRepository carRepository;


//    public String validate(Car car) {
//        if (car.getPlateNo().equals("") || car.getColor().equals("") || car.getMakeYear() == 0 || car.getManufacturer().equals("") || car.getModel().equals("") || car.getMaxNoOfPassengers() == 0) {
//
//            return "false";
//        } else {
//            return "true";
//        }
//    }


    @Override
    public void save(Car car) {

        carRepository.save(car);
    }
}
