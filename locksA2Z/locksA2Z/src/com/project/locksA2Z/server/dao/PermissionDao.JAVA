package com.project.locksA2Z.server.dao;

import java.util.List;

import com.project.locksA2Z.server.entities.Permission;

public interface PermissionDao extends IAbstractDao<Permission>{
	public List<Permission> getAllParentPermissions();
	public List<Permission> getAllChildrenPermissions(Long id);
}
