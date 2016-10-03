package com.project.locksA2Z.server.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.jpa.JpaTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.project.locksA2Z.server.dao.CustomerDao;
import com.project.locksA2Z.server.dao.base.AbstractDao;
import com.project.locksA2Z.server.entities.Customer;
import com.project.locksA2Z.server.entities.Permission;
import com.project.locksA2Z.util.Authority;

public class CustomerDaoImpl extends AbstractDao<Customer> implements CustomerDao {

	public CustomerDaoImpl(JpaTemplate jpaTemplate) {
		super(jpaTemplate);
		setEntityClass(Customer.class);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		// User type from our class
		Customer user = getUserDetailByUsername(username);
		System.out.println(username);
		// User type from spring security class
		Set<Permission> allAuthorities = new HashSet<Permission>();
		org.springframework.security.core.userdetails.User springUser = new org.springframework.security.core.userdetails.User(user.getName(), user.getPassword(), true, true, true, true,
				Authority.getAuthorities(allAuthorities));
		return springUser;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Customer getUserDetailByUsername(String username) {

		List<Customer> users = jpaTemplate.find("select c from customer c where c.name=?1", username);
		if (users.size() == 1) {
			return users.get(0);
		} else
			return null; // implement database data error exception
	}

}
