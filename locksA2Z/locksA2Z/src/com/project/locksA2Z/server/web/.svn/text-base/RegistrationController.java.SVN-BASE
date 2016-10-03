package com.project.locksA2Z.server.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.locksA2Z.server.entities.Customer;
import com.project.locksA2Z.server.web.Validators.RegistrationValidator;
import com.project.locksA2Z.server.web.constants.PageNames;
import com.project.locksA2Z.util.DaoFactory;

@Controller
public class RegistrationController {
	@Autowired
	private DaoFactory daoFactory;
	@Autowired
	public RegistrationValidator registrationValidator;

	@RequestMapping("/registration.htm")
	public String redirect(Model model) {
		model.addAttribute("customer", new Customer());
		return PageNames.REGISTRATION_PAGE;
	}

	@RequestMapping(value = "/newRegistrationSubmit.htm", method = RequestMethod.POST)
	public String addCustomer(@ModelAttribute("customer") Customer customer, BindingResult result, Model model) {
		registrationValidator.validate(customer, result);
		if (!result.hasErrors()) {
			daoFactory.getCustomerDao().store(customer);
			model.addAttribute("customer",daoFactory.getCustomerDao().findById(customer.getId()));
			model.addAttribute("message", "successfully registered");
			return PageNames.REGISTRATION_CONFIRMED;
		}
		return PageNames.REGISTRATION_PAGE;
	}
}
