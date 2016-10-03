package com.project.locksA2Z.server.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.jpa.JpaTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.project.locksA2Z.server.dao.UserDao;
import com.project.locksA2Z.server.dao.base.AbstractDao;
import com.project.locksA2Z.server.entities.Permission;
import com.project.locksA2Z.server.entities.Role;
import com.project.locksA2Z.server.entities.User;
import com.project.locksA2Z.util.Authority;

public class UserDaoImpl extends AbstractDao<User> implements UserDao {

	public UserDaoImpl(JpaTemplate jpaTemplate) {
		super(jpaTemplate);
		setEntityClass(User.class);
	}

	// -----------------------UserDetailService-----------------//
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {
		// User type from our class
		User user = getUserDetailByUsername(username);
		System.out.println(user.getUsername());
		// User type from spring security class
		Set<Permission> allAuthorities = new HashSet<Permission>();
		for (Role role : user.getRoles()) {
			allAuthorities.addAll(role.getPermissions());
		}
		org.springframework.security.core.userdetails.User springUser = new org.springframework.security.core.userdetails.User(
				user.getUsername(), user.getPassword(), true, true, true, true,
				Authority.getAuthorities(allAuthorities));
		return springUser;
	}

	// -----------------------UserDao-------------------//
	@SuppressWarnings("unchecked")
	@Override
	public User getUserDetailByUsername(String username) {

		List<User> users = jpaTemplate.find(
				"select u from User u where u.username=?1", username);
		if (users.size() == 1) {
			return users.get(0);
		} else
			return null; // implement database data error exception
	}

	public Set<User> getUsersFromRole(Role role) {
		Set<User> assignedUser = new HashSet<User>();
		List<User> users = getAll();
		for (User user : users) {
			for (Role r : user.getRoles()) {
				if (r.getId() == role.getId()) {
					assignedUser.add(user);
				}
			}
		}
		return assignedUser;
	}
}
