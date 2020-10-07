package com.bonvoyage.formatter;

import java.text.Format;
import java.text.ParseException;
import java.util.Locale;

import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import com.bonvoyage.domain.ZipCode;
import org.springframework.stereotype.Component;

/** Custom zip code formatter built to make sure the user enters/receives a correct zip code.
 * 
 * @author Aser Ahmad
 * @author aaahmad@mum.edu
 * @version 1.0
 * @since 1.0
 *
 */

@Component
public class ZipCodeFormatter implements Formatter<ZipCode>{

	@Override
	public String print(ZipCode zipCode, Locale locale) {
		// if no extended code, return basic code only. Otherwise, return basic code +
		// extended code padded to five places.
		if (zipCode.getPlusFour()==0)
			return zipCode.getBasicCode() + "";
		return zipCode.getBasicCode() + "-" + String.format("%05d", zipCode.getPlusFour());
	}

	@Override
	public ZipCode parse(String source, Locale locale) throws ParseException {
		ZipCode zipCode = new ZipCode();
		zipCode.setBasicCode(Integer.parseInt(source.substring(0, 4)));
		zipCode.setPlusFour(Integer.parseInt(source.substring(6)));
		return zipCode;
	}

}
