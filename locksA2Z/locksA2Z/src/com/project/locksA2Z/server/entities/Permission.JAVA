package com.project.locksA2Z.server.entities;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Permission extends EntityBase {
	private String detailName;
	private Permission parentPermission;
	private Set<Role> roles;

	public String getDetailName() {
		return detailName;
	}

	public void setDetailName(String detailName) {
		this.detailName = detailName;
	}

	@ManyToOne
	@JoinColumn(name="parent_id")
	public Permission getParentPermission() {
		return parentPermission;
	}

	public void setParentPermission(Permission parentPermission) {
		this.parentPermission = parentPermission;
	}
	
	@ManyToMany(mappedBy = "permissions")
	 public Set<Role> getRoles() {
	  return roles;
	 }

	 public void setRoles(Set<Role> roles) {
	  this.roles = roles;
	 }
}
