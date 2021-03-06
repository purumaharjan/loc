package com.project.locksA2Z.server.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.locksA2Z.server.entities.User;
import com.project.locksA2Z.server.web.Validators.UserValidator;
import com.project.locksA2Z.server.web.constants.PageNames;
import com.project.locksA2Z.util.DaoFactory;

@Controller
@RequestMapping("/admin/")
public class AdminsUsersController {
	@Autowired
	public DaoFactory daoFactory;

	@Autowired
	public UserValidator userValidator;

	@RequestMapping(value = "/formTask.htm", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user,
			BindingResult result, Model model) {

		userValidator.validate(user, result);
		if (!result.hasErrors()) {
			if (user.getId() > 0) {
				User managedUser = daoFactory.getUserDao().findById(
						user.getId());
				user.setRoles(managedUser.getRoles());
				daoFactory.getUserDao().update(user);
				model.addAttribute("message",
						"User Detail Successfully Updated");
			} else {
				user.setRoles(null);
				daoFactory.getUserDao().store(user);
				model.addAttribute("message", "User Detail Successfully Added.");
			}
		} else {
			model.addAttribute("user", user);
			model.addAttribute("pageToDisplay", "AdminsUsers");
			model.addAttribute("task", "add");
			model.addAttribute("rootPermissions", daoFactory.getPermissionDao()
					.getAllParentPermissions());
			return PageNames.ADMIN_PAGE;
		}
		return "redirect:manage.htm?page=ROLE_ManageAdminsUsers&task=list&paging=1";
	}

	@RequestMapping(value = "/DeletionTaskUsers.htm", method = RequestMethod.POST)
	public String deleteSeleted(@RequestParam("list") String list,
			@RequestParam("pageToDisplay") String page) {
		String[] ids = list.split(",");
		for (String id : ids) {
			daoFactory.getUserDao().deleteById(Long.parseLong(id));
		}
		return "redirect:manage.htm?page=ROLE_Manage" + page
				+ "&task=list&paging=1";
	}
}
