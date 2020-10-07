package com.bonvoyage.domain;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Set;

/**
 * Class to hold address data.
 *
 * @author Ali M Ahmadi
 * @author amahmadi@mum.edu
 * @version 1.0
 * @since 1.0
 */
@Entity
public class Driver implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @NotBlank
    @Size(min = 9, max = 9, message = "{Size.licenseNo.validation}")
    private String drivingLicenseNo;

    @NotNull
    @DateTimeFormat(pattern = "MM-dd-yyyy")
    private LocalDate drivingExpirationDate;

    private boolean isDriverApproved;

    @DateTimeFormat(pattern = "MM-dd-yyyy")
    private LocalDate driverApprovalDate;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Valid
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "car_id")
    private Car car;

    @OneToMany
    @JoinColumn(name = "driver_id")
    private Set<Trip> trips;


    public Driver() {
    }

    public Driver(String drivingLicenseNo, LocalDate drivingExpirationDate) {
        this.drivingLicenseNo = drivingLicenseNo;
        this.drivingExpirationDate = drivingExpirationDate;

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDrivingLicenseNo() {
        return drivingLicenseNo;
    }

    public void setDrivingLicenseNo(String drivingLicenseNo) {
        this.drivingLicenseNo = drivingLicenseNo;
    }

    public LocalDate getDrivingExpirationDate() {
        return drivingExpirationDate;
    }

    public void setDrivingExpirationDate(LocalDate drivingExpirationDate) {
        this.drivingExpirationDate = drivingExpirationDate;
    }

    public boolean isDriverApproved() {
        return isDriverApproved;
    }

    public void setDriverApproved(boolean driverApproved) {
        isDriverApproved = driverApproved;
    }

    public LocalDate getDriverApprovalDate() {
        return driverApprovalDate;
    }

    public void setDriverApprovalDate(LocalDate driverApprovalDate) {
        this.driverApprovalDate = driverApprovalDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public Long getUserID() {
        return user.getId();
    }

    public void setUserID(Long userId) {
        this.user.setId(userId);
    }

    public Set<Trip> getTrips() {
        return trips;
    }

    public void setTrips(Set<Trip> trips) {
        this.trips = trips;
    }

}
