package com.bonvoyage.validator;
/* Custom annotation to make sure the entered username is unique and externalize the error message
   in case this constraint is violated. This avoids throwing an exception in case a non-unique username
   was attempted.

  @author Aser Ahmad
 * @author aaahmad@mum.edu
 * @version 1.0
 * @since 1.0

 */
import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Target({ElementType.METHOD,ElementType.FIELD,ElementType.ANNOTATION_TYPE,ElementType.PARAMETER})
@Retention(value= RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UniqueUsernameValidator.class)
public @interface UniqueUsername {
    String message() default "{Unique.username}";
    Class<?>[] groups() default { };
    Class<? extends Payload>[] payload() default { };
}