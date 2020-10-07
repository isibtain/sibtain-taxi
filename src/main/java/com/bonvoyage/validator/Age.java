package com.bonvoyage.validator;
/** Custom annotation to make sure the entered age is not less than the minimum allowable age.
 * 
 * @author Aser Ahmad
 * @author aaahmad@mum.edu
 * @version 1.0
 * @since 1.0
 *
 */

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ElementType.METHOD,ElementType.FIELD,ElementType.ANNOTATION_TYPE,ElementType.PARAMETER})
@Retention(value=RetentionPolicy.RUNTIME)
@Constraint(validatedBy = AgeValidator.class)

public @interface Age {
	public long min() default 18; //Default value for the parameter at @Age annotation
	String message() default "{Age}";
	Class<?>[] groups() default {};
	public abstract Class <? extends Payload>[] payload() default{};
}
