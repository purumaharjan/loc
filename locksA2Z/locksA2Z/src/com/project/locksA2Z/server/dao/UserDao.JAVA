package com.project.locksA2Z.server.dao;

import java.util.Set;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.project.locksA2Z.server.entities.Role;
import com.project.locksA2Z.server.entities.User;

public interface UserDao extends UserDetailsService,IAbstractDao<User>{
	public User getUserDetailByUsername(String username);
	public Set<User> getUsersFromRole(Role role);
}
