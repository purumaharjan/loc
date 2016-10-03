package com.project.locksA2Z.server.web.Validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.project.locksA2Z.server.entities.User;
import com.project.locksA2Z.util.DaoFactory;

public class UserValidator implements Validator {

	@Autowired
	public DaoFactory daoFactory;

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		User euser = daoFactory.getUserDao().findById(user.getId());
		ValidationUtils.rejectIfEmpty(errors, "name", null,
				"Please Specify the name");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", null,
				"Please enter a username(without whitespaces)");
		if (user.getId() < 0 || !euser.getUsername().equals(user.getUsername())) {
			if (daoFactory.getUserDao().getUserDetailByUsername(
					user.getUsername()) != null) {
				errors.rejectValue("username", null, "Username already taken.");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", null,
				"Please specify password(without whitespaces)");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword",
				null, "Please specify password(without whitespaces)");
		if (!user.getPassword().equals(user.getConfirmPassword())) {
			errors.rejectValue("password", null,
					"Password Mismatch. Please reconfirm");
		}
	}

}
