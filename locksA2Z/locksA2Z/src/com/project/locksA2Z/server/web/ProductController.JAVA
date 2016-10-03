package com.project.locksA2Z.server.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.locksA2Z.server.entities.Category;
import com.project.locksA2Z.server.entities.Product;
import com.project.locksA2Z.server.web.constants.PageNames;
import com.project.locksA2Z.util.DaoFactory;
import com.project.locksA2Z.util.imageupload.ImageUploader;

@Controller
@RequestMapping("/admin/")
public class ProductController {
	@Autowired
	private DaoFactory daoFactory;

	@Autowired
	private HashMap<String, String> folderPathToSize;

	@RequestMapping(value = "addProduct.htm", method = RequestMethod.GET)
	public String showAddProductForm(@RequestParam("page") String page,
			@RequestParam("task") String task, Model model) {

		page = page.substring(11); // removing Role_Manage

		model.addAttribute("pageToDisplay", page);
		model.addAttribute("rootPermissions", daoFactory.getPermissionDao()
				.getAllParentPermissions());

		model.addAttribute("task", task);
		model.addAttribute(new Product());
		model.addAttribute("leafCategories", daoFactory.getCategoryDao()
				.getAllLeafCategories());
		return PageNames.ADMIN_PAGE;
	}

	@RequestMapping(value = "/addProductSubmit.htm", method = RequestMethod.POST)
	public String addProduct(@RequestParam("categoryName") String categoryName,
			@ModelAttribute("product") Product product, BindingResult result,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session, Model model) throws IOException {
		if (result.hasErrors()) {
			for (ObjectError error : result.getAllErrors()) {
				System.err.println("Error: " + error.getCode() + " - "
						+ error.getDefaultMessage());
			}
			return PageNames.ADMIN_PAGE;
		}
		product.setProductImage(ImageUploader.uploadImage(
				product.getFileData(), folderPathToSize));

		if (product.getId() > 0) {
			if (product.getProductImage() == null) {
				Product buffProduct = daoFactory.getProductDao().findById(
						product.getId());
				product.setProductImage(buffProduct.getProductImage());
			}
			List<Category> category = daoFactory.getCategoryDao().findByName(
					categoryName);
			product.setCategory(category.get(0));
			daoFactory.getProductDao().update(product);
			model.addAttribute("message", "' " + product.getName() + " '"
					+ " Product Successfully Updated");
		} else {
			List<Category> category = daoFactory.getCategoryDao().findByName(
					categoryName);
			product.setCategory(category.get(0));
			daoFactory.getProductDao().store(product);
			model.addAttribute("message", "' " + product.getName() + " '"
					+ " Product Successfully Added");
		}

		return "redirect:manage.htm?page=ROLE_ManageProduct&task=list&paging=1";
	}

	@RequestMapping(value = "deleteProduct.htm", method = RequestMethod.GET)
	public String deleteProduct(@RequestParam("productId") Long productId) {
		Product product = daoFactory.getProductDao().findById(productId);
		String deleteImageName = product.getProductImage();
		daoFactory.getProductDao().deleteById(productId);
		ImageUploader.deleteImage(deleteImageName, folderPathToSize.keySet());
		return "redirect:manage.htm?page=ROLE_ManageProduct&task=list&paging=1";
	}

	@RequestMapping(value = "updateProduct.htm", method = RequestMethod.GET)
	public String updateProduct(@RequestParam("productId") Long productId,
			@RequestParam("page") String page,
			@RequestParam("task") String task, Model model) {
		page = page.substring(11); // removing Role_Manage
		model.addAttribute("pageToDisplay", page);
		model.addAttribute("rootPermissions", daoFactory.getPermissionDao()
				.getAllParentPermissions());
		model.addAttribute("task", task);
		Product product = daoFactory.getProductDao().findById(productId);
		model.addAttribute("product", product);
		model.addAttribute("productCategory", product.getCategory());
		model.addAttribute("leafCategories", daoFactory.getCategoryDao()
				.getAllLeafCategories());
		return PageNames.ADMIN_PAGE;
	}

	@RequestMapping(value = "deleteProductImage.htm", method = RequestMethod.GET)
	public String deleteImage(@RequestParam("productId") Long productId,
			Model model) {
		Product product = daoFactory.getProductDao().findById(productId);
		String deleteImageName = product.getProductImage();
		product.setProductImage(null);
		ImageUploader.deleteImage(deleteImageName, folderPathToSize.keySet());
		daoFactory.getProductDao().update(product);
		return "redirect:updateProduct.htm?page=ROLE_ManageProduct&task=editProduct&paging=1&productId="
				+ Long.toString(productId);
	}

	@RequestMapping(value = "displayProductDetails.htm", method = RequestMethod.GET)
	public String displayProductDetails(
			@RequestParam("productId") String productId, Model model) {
		model.addAttribute("product", daoFactory.getProductDao().findById(Long.valueOf(productId)));
		return "admin/product/displayProductDetails";
	}

	@RequestMapping(value = "/DeletionTaskProducts.htm", method = RequestMethod.POST)
	public String deleteSeleted(@RequestParam("list") String list,
			@RequestParam("pageToDisplay") String page) {
		String[] ids = list.split(",");
		for (String id : ids) {
			daoFactory.getProductDao().deleteById(Long.parseLong(id));
		}
		return "redirect:manage.htm?page=ROLE_Manage" + page
				+ "&task=list&paging=1";
	}
}
