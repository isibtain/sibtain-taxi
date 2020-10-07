package com.bonvoyage.validator;
/** Custom annotation to make sure the entered age is not less than the minimum allowable age.
 * 
 * @author Aser Ahmad
 * @author aaahmad@mum.edu
 * @version 1.0
 * @since 1.0
 *
 */

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD,ElementType.FIELD,ElementType.ANNOTATION_TYPE,ElementType.PARAMETER})
@Retention(value=RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidThroughValidator.class)

public @interface ValidThrough {
	public long min() default 1; //Default value for the parameter at @ValidThrough annotation
	String message() default "{NoOfYears}";
	Class<?>[] groups() default {};
	public abstract Class <? extends Payload>[] payload() default{};
}
