package com.project.locksA2Z.server.web.Validators;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.project.locksA2Z.server.entities.Role;
import com.project.locksA2Z.util.DaoFactory;

public class RoleValidator implements Validator {

	@Autowired
	public DaoFactory daoFactory;

	@Override
	public boolean supports(Class<?> arg0) {
		return Role.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "name", null,
				"Please enter a name");
		Role role = (Role) target;
		Role erole = daoFactory.getRoleDao().findById(role.getId());
		if (role.getId() < 0||!erole.getName().equals(role.getName())) {
			List<Role> roles = daoFactory.getRoleDao().findByName(
					role.getName());
			if (!roles.isEmpty()) {
				errors.rejectValue("name", null, "Role name already exists.");
			}
		} 
		if (role.getPermissions().isEmpty()) {
			errors.rejectValue("permissions", null,
					"Please specify permissions for the role");
		}
	}

}
