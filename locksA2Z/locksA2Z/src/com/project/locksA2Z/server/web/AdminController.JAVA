package com.project.locksA2Z.server.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.locksA2Z.server.dao.IAbstractDao;
import com.project.locksA2Z.server.entities.Category;
import com.project.locksA2Z.server.entities.EntityBase;
import com.project.locksA2Z.server.entities.Orders;
import com.project.locksA2Z.server.entities.Product;
import com.project.locksA2Z.server.entities.Role;
import com.project.locksA2Z.server.entities.User;
import com.project.locksA2Z.server.web.Validators.UserValidator;
import com.project.locksA2Z.server.web.constants.PageNames;
import com.project.locksA2Z.util.DaoFactory;
import com.project.locksA2Z.util.Pagination;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	public DaoFactory daoFactory;

	@Autowired
	public UserValidator userValidator;

	public Pagination pages = new Pagination();

	Map<String, IAbstractDao<? extends EntityBase>> adminPageToDao = new HashMap<String, IAbstractDao<? extends EntityBase>>();

	private void initializeMap() {
		adminPageToDao.put("AdminsUsers", daoFactory.getUserDao());
		adminPageToDao.put("Inventory", daoFactory.getInventoryDao());
		adminPageToDao.put("Orders", daoFactory.getOrdersDao());
		adminPageToDao.put("Category", daoFactory.getCategoryDao());
		adminPageToDao.put("Product", daoFactory.getProductDao());
	}

	@RequestMapping
	public String getAdminPage(Model model) {
		model.addAttribute("pageToDisplay", "home");
		model.addAttribute("rootPermissions", daoFactory.getPermissionDao().getAllParentPermissions());
		return PageNames.ADMIN_PAGE;
	}

	@RequestMapping(value = "manage.htm", method = RequestMethod.GET)
	public String getManagePage(@RequestParam("page") String page, @RequestParam("task") String task, @RequestParam("paging") int paging, Model model) throws IOException {
		initializeMap();
		page = page.substring(11); // removing Role_Manage
		model.addAttribute("pageToDisplay", page);
		model.addAttribute("rootPermissions", daoFactory.getPermissionDao().getAllParentPermissions());
		model.addAttribute("task", task);
		if (page.equals("AdminsUsers")) {
			if (task.equals("list")) {
				pages.setTotalCount(daoFactory.getUserDao().getCount());
				model.addAttribute("maxPageSize", pages.getMaxPageSize());
				System.out.println("UserCount:::::" + daoFactory.getUserDao().getCount());
				model.addAttribute("baseEntities", getEntityClassForPage(page, paging));
				pages.setCurrentPage(paging);
				model.addAttribute("currentPage", pages.getCurrentPage());
			} else if (task.equals("add")) {
				model.addAttribute("user", new User());
			}
		} else if (page.equals("Orders")) {
			Orders orders = new Orders();
			model.addAttribute(orders);
			pages.setTotalCount(daoFactory.getOrdersDao().getCount());
			model.addAttribute("maxPageSize", pages.getMaxPageSize());
			System.out.println("OrderCount:::::" + daoFactory.getOrdersDao().getCount());
			model.addAttribute("orderEntities", daoFactory.getOrdersDao().getAllWithPaging(paging));
			pages.setCurrentPage(paging);
			model.addAttribute("currentPage", pages.getCurrentPage());
		} else if (page.equals("Inventory")) {
			pages.setTotalCount(daoFactory.getInventoryDao().getCount());
			model.addAttribute("maxPageSize", pages.getMaxPageSize());
			System.out.println("InventoryCount:::::" + daoFactory.getInventoryDao().getCount());
			model.addAttribute("inventories", daoFactory.getInventoryDao().getAllWithPaging(paging));
			pages.setCurrentPage(paging);
			model.addAttribute("currentPage", pages.getCurrentPage());
		} else if (page.equals("Category")) {
			pages.setTotalCount(daoFactory.getCategoryDao().getAllCategories().size());
			model.addAttribute("maxPageSize", pages.getMaxPageSize());
			System.out.println("CategoryCount:::::" + daoFactory.getCategoryDao().getCount());
			model.addAttribute("availableCategories", daoFactory.getCategoryDao().getAllCategoryWithPaging(paging, null));
			pages.setCurrentPage(paging);
			model.addAttribute("currentPage", pages.getCurrentPage());
			model.addAttribute("currentId", "null");
		} else if (page.equals("Product")) {
			pages.setTotalCount(daoFactory.getProductDao().getCount());
			model.addAttribute("maxPageSize", pages.getMaxPageSize());
			List<Product> products = daoFactory.getProductDao().getAllWithPaging(paging);
			model.addAttribute("availableProducts", products);
			pages.setCurrentPage(paging);
			model.addAttribute("currentPage", pages.getCurrentPage());
			List<String> breadcrumbs = new ArrayList<String>();
			for (Product product : products) {

				List<String> buffer = new ArrayList<String>();
				Category category = product.getCategory();
				while (category != null) {
					buffer.add(category.getName());
					category = category.getCategoryParentId();
				}

				String val = "";
				for (int i = buffer.size() - 1; i >= 0; i--)
					val += buffer.get(i) + " > ";

				breadcrumbs.add(val);
			}
			// write buffer to breadcrumbs in reverse order

			model.addAttribute("breadcrumbs", breadcrumbs);

			// copy images

			BufferedImage image = null;
			String path = "C:\\test\\thumbsLarge\\";

			String files;
			File folder = new File(path);
			File[] listOfFiles = folder.listFiles();

			for (int i = 0; i < listOfFiles.length; i++) {

				if (listOfFiles[i].isFile()) {
					files = listOfFiles[i].getName();
					System.out.println(files);
					File file = new File("C:\\test\\thumbsLarge\\" + files);
					image = ImageIO.read(file);
					String directoryPath = System.getProperty("user.dir");
					directoryPath = directoryPath.substring(0, directoryPath.length() - 3);
					System.out.println(directoryPath);
					ImageIO.write(image, "jpg", new File(directoryPath + "webapps/locksA2Z/resources/images/" + files));
				}
			}

		} else if (page.equals("Roles")) {
			model.addAttribute("currentPage", paging);
			if (task.equals("list")) {
				pages.setTotalCount(daoFactory.getRoleDao().getCount());
				model.addAttribute("availableRoles", daoFactory.getRoleDao().getAllWithPaging(paging));
				model.addAttribute("maxPageSize", pages.getMaxPageSize());
				pages.setCurrentPage(paging);

			} else if (task.equals("add")) {
				model.addAttribute("role", new Role());
				model.addAttribute("users", daoFactory.getUserDao().getAll());
				model.addAttribute("permissions", daoFactory.getPermissionDao().getAll());
			}
		}

		return PageNames.ADMIN_PAGE;
	}

	@RequestMapping(value = "managewithid.htm", method = RequestMethod.GET)
	public String getManagePageId(@ModelAttribute("orders") Orders orders, @RequestParam("page") String page, @RequestParam("task") String task, @RequestParam("id") long id,
			@RequestParam("paging") int paging, Model model) {
		initializeMap();
		page = page.substring(11);
		model.addAttribute("pageToDisplay", page);
		model.addAttribute("rootPermissions", daoFactory.getPermissionDao().getAllParentPermissions());
		if (page.equals("Orders")) {
			if (task.equals("productList")) {
				model.addAttribute("orders", daoFactory.getOrdersDao().findById(id));
				pages.setCurrentPage(paging);
				model.addAttribute("currentPage", pages.getCurrentPage());
			} else if (task.equals("delete")) {
				daoFactory.getOrdersDao().deleteById(id);
				pages.setCurrentPage(paging);
				model.addAttribute("currentPage", pages.getCurrentPage());
				model.asMap().clear();
				return "redirect:manage.htm?page=ROLE_ManageOrders&task=list&paging=" + pages.getCurrentPage();
			}
		}

		else if (page.equals("AdminsUsers")) {
			if (task.equals("delete")) {
				daoFactory.getUserDao().deleteById(id);
				pages.setCurrentPage(paging);
				model.addAttribute("currentPage", pages.getCurrentPage());
				model.asMap().clear();
				model.addAttribute("message", "Delete Successful");
				return "redirect:manage.htm?page=ROLE_ManageAdminsUsers&task=list&paging=" + pages.getCurrentPage();
			} else if (task.equals("edit")) {
				User user = daoFactory.getUserDao().findById(id);

				Set<Role> roles = user.getRoles();
				for (Role role : roles) {
					System.out.println(role.getName() + " SELECT statement from ID");
				}
				user.setConfirmPassword(user.getPassword());
				model.addAttribute("user", user);
			}
		} else if (page.equals("Roles")) {
			if (task.equals("delete")) {
				Role role = daoFactory.getRoleDao().findById(id);
				Set<User> users = new HashSet<User>();
				users = daoFactory.getUserDao().getUsersFromRole(role);
				daoFactory.getRoleDao().update(role);

				for (User user : users) {
					Set<Role> roles = user.getRoles();
					Role roleToDelete = null;
					for (Role tempRole : roles) {
						if (tempRole.getId() == id) {
							roleToDelete = tempRole;
							break;
						}
					}
					roles.remove(roleToDelete);
					user.setRoles(roles);
					daoFactory.getUserDao().update(user);
				}
				daoFactory.getRoleDao().deleteById(id);

				model.asMap().clear();
				model.addAttribute("message", "Successfully Deleted");
				return "redirect:manage.htm?page=ROLE_ManageRoles&task=list&paging=" + paging;
			} else if (task.equals("edit")) {
				Role role = daoFactory.getRoleDao().findById(id);
				role.setUsers(daoFactory.getUserDao().getUsersFromRole(role));
				model.addAttribute("role", role);
				model.addAttribute("users", daoFactory.getUserDao().getAll());
				model.addAttribute("permissions", daoFactory.getPermissionDao().getAll());
				model.addAttribute("currentPage", paging);
				model.addAttribute("selectedId", id);
			}
		}

		model.addAttribute("task", task);
		return PageNames.ADMIN_PAGE;
	}

	@RequestMapping(value = "updateOrderStatus.htm", method = RequestMethod.GET)
	public String getManagePageId(@RequestParam("page") String page, @RequestParam("task") String task, @RequestParam("id") long id, @RequestParam("orderStatus") String status,
			@RequestParam("paging") int paging, Model model) {
		initializeMap();
		page = page.substring(11);
		model.addAttribute("rootPermissions", daoFactory.getPermissionDao().getAllParentPermissions());
		if (page.equals("Orders")) {
			if (task.equals("productList")) {
				Orders orders = daoFactory.getOrdersDao().findById(id);
				if (status.equals("ordered")) {
					orders.setOrderStatus("ordered");
				} else if (status.equals("process")) {
					orders.setOrderStatus("process");
				} else if (status.equals("delivered")) {
					orders.setOrderStatus("delivered");
				}
				daoFactory.getOrdersDao().update(orders);
				pages.setCurrentPage(paging);
				model.addAttribute("currentPage", pages.getCurrentPage());
				model.asMap().clear();
				return "redirect:managewithid.htm?page=ROLE_ManageOrders&task=productList&id=" + id + "&paging=" + pages.getCurrentPage();
			}
		}
		return PageNames.ADMIN_PAGE;
	}

	@RequestMapping(value = "managewithidlist.htm", method = RequestMethod.GET)
	public String getManagePageId(@RequestParam("page") String page, @RequestParam("task") String task, @RequestParam("idList") String idList, Model model) {
		initializeMap();
		page = page.substring(11);
		model.addAttribute("rootPermissions", daoFactory.getPermissionDao().getAllParentPermissions());
		if (page.equals("Orders")) {
			if (task.equals("deleteSelected")) {
				String delims = "[,]";
				String[] tokens = idList.split(delims);
				for (int i = 0; i < tokens.length; i++) {
					daoFactory.getOrdersDao().deleteById(Long.parseLong(tokens[i]));
				}
				return "redirect:manage.htm?page=ROLE_ManageOrders&task=list&paging=1";
			}
		}
		return PageNames.ADMIN_PAGE;
	}

	@SuppressWarnings("unchecked")
	private List<EntityBase> getEntityClassForPage(String page, int paging) {
		List<? extends EntityBase> entities = adminPageToDao.get(page).getAllWithPaging(paging);
		return (List<EntityBase>) entities;
	}
}
