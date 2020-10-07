package com.bonvoyage.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

/**
 * Validation rule for future LocalDate to make sure it is after today by the entered NoOfYears.
 * @author Aser Ahmad
 * @author aaahmad@mum.edu
 * @version 1.0
 * @since 1.0
 *
 */

public class ValidThroughValidator implements ConstraintValidator<ValidThrough, LocalDate>{

	private long minNoOfYears;

	@Override
	public void initialize(ValidThrough enteredNoOfYears) {
		this.minNoOfYears = enteredNoOfYears.min();
	}

	@Override
	public boolean isValid(LocalDate checkedDate, ConstraintValidatorContext context) {
		// Date is valid only if it is after today by >= the specified no. of years
		if(checkedDate == null)
			return false;
		LocalDate today = LocalDate.now();
		return ChronoUnit.YEARS.between(today, checkedDate) >= minNoOfYears;
	}

}
