package com.bonvoyage.exception;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;

/** Custom exception to handle the case where the user tries to upload a big file.
 * 
 * @author Aser Ahmad
 * @author aaahmad@mum.edu
 * @version 1.0
 * @since 1.0
 *
 */
@ControllerAdvice
public class ExceptionHandlers {

	@Autowired
	MessageSource messageSource;
	private final String FILE_SIZE_ERROR = "Exception.file.size";
	
	@ExceptionHandler(MaxUploadSizeExceededException.class)
	public ModelAndView uploadSizeExceeded(HttpServletRequest req ,
			MaxUploadSizeExceededException exception, Locale locale ) {
		ModelAndView mav = new ModelAndView();
		// Externalized error message for internationalization
		String errorMessage = messageSource.getMessage(FILE_SIZE_ERROR, null, locale);
		mav.addObject("fileTooLarge", errorMessage);
		mav.setViewName("errorPage");
		return mav;
	}
}
