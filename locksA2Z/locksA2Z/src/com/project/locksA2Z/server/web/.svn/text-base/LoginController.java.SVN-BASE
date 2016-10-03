package com.project.locksA2Z.server.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.locksA2Z.server.web.constants.PageNames;
import com.project.locksA2Z.util.LoginModelProvider;

@Controller
public class LoginController {
	
	@RequestMapping("/login.htm")
	public String getLoginPage(Model model){
		LoginModelProvider.getDefaultIntoModel(model);
		return PageNames.LOGIN_PAGE;
	}
	
	@RequestMapping("/logout.htm")
	public String getLogoutPage(Model model){
		model.addAttribute(LoginModelProvider.LOGOUT, "LOGOUT SUCCESSFUL");
		return PageNames.LOGIN_PAGE;
	}
	
	@RequestMapping("/main.htm")
	public String getMainLoginPage(Model model){
		LoginModelProvider.getDefaultIntoModel(model);
		return PageNames.MAIN_PAGE;
	}
}
