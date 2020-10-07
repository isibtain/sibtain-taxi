package com.bonvoyage.domain;


import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDate;
/**
 * Class to hold address data.
 *
 * @author Ali M Ahmadi
 * @author amahmadi@mum.edu
 * @version 1.0
 * @since 1.0
 */
@Entity
public class Car implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @NotBlank
    private String plateNo;

    @NotBlank
    private String manufacturer;

    @NotBlank
    private String model;

    @NotNull
    @Range(min = 1900, message = "{Size.makeYear.Validation}")
    private int makeYear;
    @NotBlank
    private String color;

    @NotNull
    @Range(min = 1, max = 20, message = "{Size.maxNoOfPassengers.Validation}")
    private int maxNoOfPassengers;

    @OneToOne(mappedBy = "car")
    private Driver driver;


    public Car() {  }

    public Car(String plateNo, String manufacturer, String model, int makeYear, String color, int maxNoOfPassengers) {
        this.plateNo = plateNo;

        this.manufacturer = manufacturer;
        this.model = model;
        this.makeYear = makeYear;
        this.color = color;
        this.maxNoOfPassengers = maxNoOfPassengers;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPlateNo() {
        return plateNo;
    }

    public void setPlateNo(String plateNo) {
        this.plateNo = plateNo;
    }



    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getMakeYear() {
        return makeYear;
    }

    public void setMakeYear(int makeYear) {
        this.makeYear = makeYear;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getMaxNoOfPassengers() {
        return maxNoOfPassengers;
    }

    public void setMaxNoOfPassengers(int maxNoOfPassengers) {
        this.maxNoOfPassengers = maxNoOfPassengers;
    }

    public Driver getDriver() {
        return driver;
    }

    public void setDriver(Driver driver) {
        this.driver = driver;
    }
}
