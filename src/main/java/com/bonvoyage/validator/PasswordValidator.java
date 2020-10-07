package com.bonvoyage.validator;

import java.util.stream.IntStream;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/** Custom validator built to verify that the selected password conforms to the business security rules.
 * 
 * @author Aser Ahmad
 * @author aaahmad@mum.edu
 * @version 1.0
 * @since 1.0
 *
 */
public class PasswordValidator implements ConstraintValidator<Password, String> {

	@Override
	public void initialize(Password value) {}

	/**
	 * @return true if all security rules are met. false otherwise
	 */
	@SuppressWarnings("deprecation")
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		boolean hasDigits = false;
		boolean hasLetters = false;
		boolean hasSpecialSigns = false;
		for (int i = 0 ; i < value.length(); i++) {
			char currentLetter = value.charAt(i);
			// Check there's no tab, new line, form feed, space
			if(Character.isSpace(currentLetter))
				return false;
			
			// Check that there is at least one digit, one letter, one special sign
			if (Character.isLetter(currentLetter))
				hasLetters=true;
			if (Character.isDigit(currentLetter))
				hasDigits = true;
			if ((!Character.isLetter(currentLetter) &&
					!Character.isDigit(currentLetter)) &&
					currentLetter < 128)
				hasSpecialSigns = true;
		}
		return hasLetters && hasDigits && hasSpecialSigns;
	}
}
