package com.project.locksA2Z.server.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.locksA2Z.server.web.constants.PageNames;
import com.project.locksA2Z.util.DaoFactory;
import com.project.locksA2Z.util.Pagination;

@Controller

public class CustomerController {

	@Autowired
	public DaoFactory daoFactory;
	
	public Pagination pages=new Pagination();	
	
	@RequestMapping(value = "productList.htm",method = RequestMethod.GET)
	public String getProductList(@RequestParam("page") String page,@RequestParam("id") long id,@RequestParam("paging") int paging,Model model) {
		model.addAttribute("pageToDisplay", "home");
		model.addAttribute("catagoryList", daoFactory.getCategoryDao().getAllCategories());
		pages.setTotalCount(daoFactory.getInventoryDao().getCountWithCategoryID(id));
		model.addAttribute("maxPageSize",pages.getMaxPageSize());
    	model.addAttribute("productList",daoFactory.getInventoryDao().getWithCategoryId(id,paging));
    	model.addAttribute("categoryId",id);
		pages.setCurrentPage(paging);
		model.addAttribute("currentPage",pages.getCurrentPage());
		return PageNames.MAIN_PAGE;
	}
}
