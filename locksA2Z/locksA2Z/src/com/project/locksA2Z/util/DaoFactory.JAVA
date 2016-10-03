package com.project.locksA2Z.util;

import com.project.locksA2Z.server.dao.CategoryDao;

import com.project.locksA2Z.server.dao.InventoryDao;

import com.project.locksA2Z.server.dao.OrdersDao;

import com.project.locksA2Z.server.dao.CustomerDao;
import com.project.locksA2Z.server.dao.PermissionDao;
import com.project.locksA2Z.server.dao.ProductDao;
import com.project.locksA2Z.server.dao.RoleDao;
import com.project.locksA2Z.server.dao.UserDao;

public class DaoFactory {

	private UserDao userDao;
	private RoleDao roleDao;
	private PermissionDao permissionDao;
	private CategoryDao categoryDao;
	private CustomerDao customerDao;
	private ProductDao productDao;

	private InventoryDao inventoryDao;

	private OrdersDao ordersDao;

	public DaoFactory() {
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	public PermissionDao getPermissionDao() {
		return permissionDao;
	}

	public void setPermissionDao(PermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}

	public InventoryDao getInventoryDao() {
		return inventoryDao;
	}

	public void setInventoryDao(InventoryDao inventoryDao) {
		this.inventoryDao = inventoryDao;
	}

	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	public OrdersDao getOrdersDao() {
		return ordersDao;
	}

	public void setOrdersDao(OrdersDao ordersDao) {
		this.ordersDao = ordersDao;
	}

	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

}
