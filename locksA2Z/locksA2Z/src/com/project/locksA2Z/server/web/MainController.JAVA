package com.project.locksA2Z.server.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.locksA2Z.server.web.constants.PageNames;
import com.project.locksA2Z.util.DaoFactory;
import com.project.locksA2Z.util.Pagination;

@Controller
@RequestMapping("/home.htm")
public class MainController {

	@Autowired
	public DaoFactory daoFactory;
	
	public Pagination pages=new Pagination();
	
	@RequestMapping(method = RequestMethod.GET)
	public String getAdminPage(Model model) {
		model.addAttribute("pageToDisplay", "home");
		model.addAttribute("currentPage",pages.getCurrentPage());
		model.addAttribute("maxPageSize",pages.getMaxPageSize());
		model.addAttribute("orders");
		model.addAttribute("categoryId");
		model.addAttribute("orderId");
		model.addAttribute("catagoryList", daoFactory.getCategoryDao()
				.getAllCategories());
		model.addAttribute("productList", daoFactory.getInventoryDao().getWithCategoryId((long)1,1));
		return PageNames.MAIN_PAGE;
	}

	

}
