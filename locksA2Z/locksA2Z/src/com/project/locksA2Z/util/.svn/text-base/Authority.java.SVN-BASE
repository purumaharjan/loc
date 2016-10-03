package com.project.locksA2Z.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.authority.GrantedAuthorityImpl;

import com.project.locksA2Z.server.entities.Permission;

public class Authority extends GrantedAuthorityImpl{

	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("unused")
	private Permission permission;
	
	public Authority(Permission permission){
		super(permission.getName());
		this.permission=permission;
		System.out.println(permission.getName());
	}
	
	public static Collection<Authority> getAuthorities(Set<Permission> permissions){
		List<Authority> authorities=new ArrayList<Authority>();
		for(Permission eachPermission:permissions){
			authorities.add(new Authority(eachPermission));
		}
		return authorities;
	}

}
