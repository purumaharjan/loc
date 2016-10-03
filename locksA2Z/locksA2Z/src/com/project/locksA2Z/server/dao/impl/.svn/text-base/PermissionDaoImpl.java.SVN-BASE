package com.project.locksA2Z.server.dao.impl;

import java.util.List;

import org.springframework.orm.jpa.JpaTemplate;

import com.project.locksA2Z.server.dao.PermissionDao;
import com.project.locksA2Z.server.dao.base.AbstractDao;
import com.project.locksA2Z.server.entities.Permission;

public class PermissionDaoImpl extends AbstractDao<Permission> implements PermissionDao{
	
	public PermissionDaoImpl(JpaTemplate jpaTemplate) {
		super(jpaTemplate);
		setEntityClass(Permission.class);
	}

	@SuppressWarnings("unchecked")
	public List<Permission> getAllParentPermissions(){
		List<Permission> permissions=jpaTemplate.find("Select p from Permission p where p.parentPermission.id=p.id");
		return permissions;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Permission> getAllChildrenPermissions(Long id) {
		List<Permission> permissions=jpaTemplate.find("Select p from Permission p where p.parentPermission.id=?1 and p.parentPermission.id!=p.id",id); 
		return permissions;
	}
}
