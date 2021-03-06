package com.project.locksA2Z.server.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.project.locksA2Z.server.entities.Permission;
import com.project.locksA2Z.server.entities.Role;
import com.project.locksA2Z.server.entities.User;
import com.project.locksA2Z.server.web.Validators.RoleValidator;
import com.project.locksA2Z.server.web.constants.PageNames;
import com.project.locksA2Z.util.DaoFactory;

@Controller
@RequestMapping("/admin/")
public class RoleController {

	@Autowired
	public DaoFactory daoFactory;

	@Autowired
	public RoleValidator roleValidator;

	@SuppressWarnings("unused")
	public class PermissionVal1 {
		private String key;
		private String title;
		protected boolean select;

		public PermissionVal1(Long id, String name, boolean select) {
			this.key = String.valueOf(id);
			this.title = name;
			this.select = select;
		}
	}

	@SuppressWarnings("unused")
	public class PermissionVal extends PermissionVal1 {

		private List<PermissionVal1> children;

		public PermissionVal(Long id, String name, Long reqId) {
			super(id, name, true);
			children = getAllPermissions(id, reqId);
			System.out.println(reqId);
		}

		private List<PermissionVal1> getAllPermissions(Long id, Long requestId) {
			List<Permission> permissions = daoFactory.getPermissionDao()
					.getAllChildrenPermissions(id);
			Role role = null;
			List<PermissionVal1> permissionVal = new ArrayList<PermissionVal1>();
			List<Long> longPermissionVal = new ArrayList<Long>();
			if (requestId != null) {
				role = daoFactory.getRoleDao().findById(requestId);
				for (Permission permission : role.getPermissions()) {
					longPermissionVal.add(permission.getId());
				}
			}
			if (permissions == null)
				return null;
			else {
				for (Permission per : permissions) {
					if (role != null && longPermissionVal.contains(per.getId())) {
						System.out.println(role.getPermissions().isEmpty());
						permissionVal.add(new PermissionVal1(per.getId(), per
								.getName(), true));
					} else {
						this.select = false;
						permissionVal.add(new PermissionVal1(per.getId(), per
								.getDetailName(), false));
					}
				}
			}
			return permissionVal;
		}
	}

	@RequestMapping(value = "/ajaxTree.htm", method = RequestMethod.GET)
	public void getPermmisions(@RequestParam("id") Long requestedId,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html");
		List<Permission> permission = daoFactory.getPermissionDao()
				.getAllParentPermissions();
		List<PermissionVal> permissionVal = new ArrayList<PermissionVal>();
		for (Permission per : permission) {
			if (per.getName().equals("ROLE_Admins"))
				continue;
			permissionVal.add(new PermissionVal(per.getId(), per.getDetailName(),
					requestedId));
		}
		Gson gson = new Gson();
		String perStr = gson.toJson(permissionVal.toArray());
		response.getWriter().write(perStr);
	}

	@RequestMapping(value = "/addRole.htm", method = RequestMethod.POST)
	public String addRole(@RequestParam("permissionList") String pIds,
			@RequestParam("userList") String uIds,
			@ModelAttribute("role") Role role, BindingResult result, Model model) {

		Set<User> prevUsers = new HashSet<User>();
		Set<User> newUsers = new HashSet<User>();
		Set<Permission> permissions = new HashSet<Permission>();

		if (!pIds.isEmpty()) {
			String[] permissionIds = pIds.split(",");
			for (int i = 0; i < permissionIds.length; i++) {
				System.out.println(permissionIds[i]);
				permissions.add(daoFactory.getPermissionDao().findById(
						Long.parseLong(permissionIds[i])));
			}
		}
		if (!uIds.isEmpty()) {
			String[] userIds = uIds.split(",");
			for (int i = 0; i < userIds.length; i++) {
				newUsers.add(daoFactory.getUserDao().findById(
						Long.parseLong(userIds[i])));
			}
		}

		role.setPermissions(permissions);
		roleValidator.validate(role, result);

		if (!result.hasErrors()) {
			permissions.add(daoFactory.getPermissionDao().findById(
					Long.parseLong("1")));
			if (role.getId() > 0) {
				Role roleToUpdate = daoFactory.getRoleDao().findById(
						role.getId());
				roleToUpdate.setName(role.getName());
				prevUsers = daoFactory.getUserDao().getUsersFromRole(
						roleToUpdate);

				roleToUpdate.setPermissions(permissions);
				daoFactory.getRoleDao().update(roleToUpdate);

				for (User user : prevUsers) {
					if (!newUsers.contains(user)) {
						Set<Role> roles = user.getRoles();
						Role roleToDelete = null;
						for (Role tempRole : roles) {
							if (tempRole.getId() == roleToUpdate.getId()) {
								roleToDelete = tempRole;
								break;
							}
						}

						roles.remove(roleToDelete);
						user.setRoles(roles);
						daoFactory.getUserDao().update(user);
					}
				}
				for (User user : newUsers) {
					if (!prevUsers.contains(user)) {
						Set<Role> roles = user.getRoles();
						roles.add(roleToUpdate);
						user.setRoles(roles);
						daoFactory.getUserDao().update(user);
					}
				}
				model.addAttribute("message", "Role updated Successfully");
			} else {

				daoFactory.getRoleDao().update(role);

				Role roleToUpdate = daoFactory.getRoleDao().findByName(
						role.getName()).get(0);
				System.out.println(roleToUpdate.getName());
				for (User user : newUsers) {
					Set<Role> roles = user.getRoles();
					roles.add(roleToUpdate);
					user.setRoles(roles);
					daoFactory.getUserDao().update(user);
				}
				model.addAttribute("message", "Role added Successfully");
			}
		} else {

			model.addAttribute("role", role);
			model.addAttribute("pageToDisplay", "Roles");
			model.addAttribute("task", "add");
			model.addAttribute("users", daoFactory.getUserDao().getAll());
			model.addAttribute("rootPermissions", daoFactory.getPermissionDao()
					.getAllParentPermissions());
			return PageNames.ADMIN_PAGE;
		}
		return "redirect:manage.htm?page=ROLE_ManageRoles&task=list&paging=1";

	}

	@Transactional
	@RequestMapping(value = "/deleteRole.htm", method = RequestMethod.POST)
	public String deleteSeleted(@RequestParam("list") String list,
			@RequestParam("pageToDisplay") String page,
			@RequestParam("paging") String paging) {

		Set<User> users = new HashSet<User>();
		String[] ids = list.split(",");
		for (String id : ids) {
			Role role = daoFactory.getRoleDao().findById(Long.parseLong(id));
			users = daoFactory.getUserDao().getUsersFromRole(role);
			daoFactory.getRoleDao().update(role);

			for (User user : users) {
				Set<Role> roles = user.getRoles();
				Role roleToDelete = null;
				for (Role tempRole : roles) {
					if (tempRole.getId() == Long.parseLong(id)) {
						roleToDelete = tempRole;
						break;
					}
				}

				roles.remove(roleToDelete);
				user.setRoles(roles);
				daoFactory.getUserDao().update(user);
			}
			daoFactory.getRoleDao().deleteById(Long.parseLong(id));
		}
		return "redirect:manage.htm?page=ROLE_ManageRoles&task=list&paging="
				+ paging;
	}
}
