package com.bonvoyage.validator;

import java.time.LocalDate;
import java.time.Period;
import java.time.temporal.ChronoUnit;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * Validation rule for Age to make sure the LocalDate entered is older by minAge years from today.
 * @author Aser Ahmad
 * @author aaahmad@mum.edu
 * @version 1.0
 * @since 1.0
 *
 */

public class AgeValidator implements ConstraintValidator<Age, LocalDate>{

	private long minAge;

	@Override
	public void initialize(Age enteredAge) {
		this.minAge = enteredAge.min();

	}

	@Override
	public boolean isValid(LocalDate checkedDate, ConstraintValidatorContext context) {
		// Age is valid only if >= the specified minimum age
		if(checkedDate == null)
			return false;
		LocalDate today = LocalDate.now();
		return ChronoUnit.YEARS.between(checkedDate, today) >= minAge;
	}

}
