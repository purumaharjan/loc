package com.project.locksA2Z.server.web.Validators;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.project.locksA2Z.server.entities.Customer;

public class RegistrationValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return Customer.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object object, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "name", null,
				"Please Specify the name");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", null,
				"Please enter a username(without whitespaces)");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", null,
				"Please specify password(without whitespaces)");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword",
				null, "Please specify password(without whitespaces)");
		Customer customer = (Customer) object;
		if (!customer.getPassword().equals(customer.getConfirmPassword())) {
			errors.rejectValue("password", null,
					"Password Mismatch. Please reconfirm");
		}
		final String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		if (!customer.getEmail().matches(EMAIL_PATTERN)) {
			errors.rejectValue("email", null,
					"Email address is not vaild.Please reconfirm");
		}
		ValidationUtils.rejectIfEmpty(errors, "email", null,
				"Please specify Email Address");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phoneNo", null,
				"Please specify Phone Number");
		ValidationUtils.rejectIfEmpty(errors, "address", null,
				"Please specify Address");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "province", null,
				"Please specify Province(without whitespaces)");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "country", null,
				"Please specify Country(without whitespaces)");
	}

}
