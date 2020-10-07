package com.bonvoyage.validator;

import com.bonvoyage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqueUsernameValidator implements ConstraintValidator<UniqueUsername, String> {
    @Autowired
    UserService userService;

    @Override
    public void initialize(UniqueUsername uniqueUsername) {}

    @Override
    public boolean isValid(String username, ConstraintValidatorContext context) {
        if(username==null)
            return false;
        try{
            return !userService.usernameExists(username);
        } catch (Exception e) {
            return true;
        }

    }
}
