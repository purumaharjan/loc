package com.project.locksA2Z.server.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.locksA2Z.server.entities.Category;
import com.project.locksA2Z.server.entities.Product;
import com.project.locksA2Z.server.web.Validators.CategoryValidator;
import com.project.locksA2Z.server.web.constants.PageNames;
import com.project.locksA2Z.util.DaoFactory;
import com.project.locksA2Z.util.Pagination;

@Controller
@RequestMapping("/admin/")
public class CategoryController {
	@Autowired
	private DaoFactory daoFactory;
	public Pagination pages = new Pagination();

	@Autowired
	public CategoryValidator categoryValidator;

	@RequestMapping(value = "addCategory.htm", method = RequestMethod.GET)
	public String showAddCategoryForm(@RequestParam("page") String page, @RequestParam("task") String task, Model model) {
		page = page.substring(11); // removing Role_Manage
		model.addAttribute("pageToDisplay", page);
		model.addAttribute("rootPermissions", daoFactory.getPermissionDao().getAllParentPermissions());
		model.addAttribute("task", task);
		Category category = new Category();
		model.addAttribute(category);
		model.addAttribute("allCategories", daoFactory.getCategoryDao().getAll());
		return PageNames.ADMIN_PAGE;
	}

	@RequestMapping(value = "/addCategorySubmit.htm", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("category") Category category,
			BindingResult result, Model model) {
		model.addAttribute("pageToDisplay", "Category");
		model.addAttribute("rootPermissions", daoFactory.getPermissionDao()
				.getAllParentPermissions());

		categoryValidator.validate(category, result);
		if (!result.hasErrors()) {
			// add/update categories
			if (category.getCategoryParentId() != null) {
				List<Category> subCategory = daoFactory.getCategoryDao()
						.findByName(category.getCategoryParentId().getName());
				category.setCategoryParentId(subCategory.get(0));
			}

			if (category.getId() > 0) {
				daoFactory.getCategoryDao().update(category);
				model.addAttribute("message", "' "+category.getName()+" '"+" Category Successfully Updated");
			} else {
				daoFactory.getCategoryDao().store(category);
				model.addAttribute("message",  "' "+category.getName()+" '"+" Category Successfully Added");
			}
		} else {
			model.addAttribute("allCategories", daoFactory.getCategoryDao()
					.getAll());
			model.addAttribute("category", category);
			model.addAttribute("task", "addCategory");
			return PageNames.ADMIN_PAGE;
		}
		pages.setTotalCount(daoFactory.getCategoryDao().getCountWithList(
				daoFactory.getCategoryDao().getAllCategories()));
		model.addAttribute("maxPageSize", pages.getMaxPageSize());
		pages.setCurrentPage(1);
		model.addAttribute("availableCategories", daoFactory.getCategoryDao()
				.getAllCategoryWithPaging(1,null));
		model.addAttribute("currentPage", 1);
		model.addAttribute("category", null);
		model.addAttribute("task", "list");
		return PageNames.ADMIN_PAGE;
	}

	@RequestMapping(value = "deleteCategory.htm", method = RequestMethod.GET)
	public String deleteCategory(@RequestParam("categoryId") Long categoryId,
			Model model) {
		Category category= daoFactory.getCategoryDao().findById(categoryId);
		List<Product> products=daoFactory.getProductDao().getWithCategoryId(categoryId);
		for(Product product:products){
			product.setCategory(null);
			daoFactory.getProductDao().update(product);			
		}
		List<Category> subcategories = daoFactory.getCategoryDao().getSubCategoryById(categoryId);
		// add null to all its subcategories
		for (Category subCategory : subcategories) {
			subCategory.setCategoryParentId(null);
			daoFactory.getCategoryDao().update(subCategory);
		}
		daoFactory.getCategoryDao().deleteById(categoryId);
		model.addAttribute("message", "' "+category.getName()+" '"+" Category Successfully Deleted");
		model.addAttribute("pageToDisplay", "Category");
		model.addAttribute("rootPermissions", daoFactory.getPermissionDao()
				.getAllParentPermissions());
		pages.setTotalCount(daoFactory.getCategoryDao().getCountWithList(
				daoFactory.getCategoryDao().getAllCategories()));
		model.addAttribute("maxPageSize", pages.getMaxPageSize());
		pages.setCurrentPage(1);
		model.addAttribute("availableCategories", daoFactory.getCategoryDao()
				.getAllCategoryWithPaging(1,null));
		model.addAttribute("category", null);
		model.addAttribute("task", "list");
		return PageNames.ADMIN_PAGE;
	}

	@RequestMapping(value = "updateCategory.htm", method = RequestMethod.GET)
	public String updateCategory(@RequestParam("categoryId") Long categoryId, @RequestParam("page") String page, @RequestParam("task") String task, @RequestParam("paging") int paging, Model model) {
		page = page.substring(11); // removing Role_Manage
		model.addAttribute("pageToDisplay", page);
		model.addAttribute("rootPermissions", daoFactory.getPermissionDao().getAllParentPermissions());
		model.addAttribute("task", task);
		pages.setCurrentPage(paging);
		model.addAttribute("currentPage", pages.getCurrentPage());
		model.addAttribute("category", daoFactory.getCategoryDao().findById(categoryId));
		model.addAttribute("allCategories", daoFactory.getCategoryDao().getAll());

		return PageNames.ADMIN_PAGE;
	}

	@RequestMapping(value = "/displaySubCategory.htm", method = RequestMethod.POST)
	public void displaySubCategory(@RequestParam(required = true, value = "categoryId") Long categoryId, HttpServletRequest requeset, HttpServletResponse response) throws IOException {
		List<Category> subCategories = daoFactory.getCategoryDao().getSubCategoryById(categoryId);
		response.setContentType("text/html");
		String resp = "";
		for (Category subCategory : subCategories) {
			resp += subCategory.getName() + ',';
		}
		if (!resp.isEmpty())
			resp = resp.substring(0, resp.length() - 1);
		response.getWriter().write(resp);
	}

	@RequestMapping(value = "/dropSubCategoryToTable.htm", method = RequestMethod.GET)
	public String dropSubCategoryToTable(@RequestParam("categoryId") String categoryId, @RequestParam("paging") String paging, Model model) {
		if(categoryId.isEmpty())
		{
			return "redirect:manage.htm?page=ROLE_ManageCategory&task=list&paging="+paging;
		}
		pages.setTotalCount(daoFactory.getCategoryDao().getCategoryCount(Long.valueOf(categoryId)));
		List<Category> availableCategories = daoFactory.getCategoryDao().getAllCategoryWithPaging(Integer.parseInt(paging), Long.parseLong(categoryId));
		Category category = daoFactory.getCategoryDao().findById(Long.valueOf(categoryId));
		List<Category> parentCategories = daoFactory.getCategoryDao().getAllParentIds(Long.valueOf(categoryId));
		model.addAttribute("maxPageSize",pages.getMaxPageSize() );
		model.addAttribute("category", category);
		model.addAttribute("availableCategories", availableCategories);
		model.addAttribute("parentCategories", parentCategories);
		model.addAttribute("task", "list");
		model.addAttribute("currentPage", paging);
		model.addAttribute("currentId", categoryId);
		model.addAttribute("pageToDisplay", "Category");
		model.addAttribute("rootPermissions", daoFactory.getPermissionDao().getAllParentPermissions());
		return PageNames.ADMIN_PAGE;
	}

	@RequestMapping(value = "/DeletionTaskCategories.htm", method = RequestMethod.POST)
	public String deleteSeleted(@RequestParam("list") String list,
			@RequestParam("pageToDisplay") String page) {
		String[] ids = list.split(",");
		for (String id : ids) {
			daoFactory.getCategoryDao().deleteById(Long.parseLong(id));
		}
		return "redirect:manage.htm?page=ROLE_Manage" + page
				+ "&task=list&paging=1";
	}
}
