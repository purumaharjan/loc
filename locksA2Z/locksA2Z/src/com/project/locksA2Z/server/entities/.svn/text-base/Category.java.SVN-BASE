package com.project.locksA2Z.server.entities;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Category extends EntityBase {
	private String categoryDescription;
	private String categoryImage;
	private Category categoryParentId;

	public String getCategoryDescription() {
		return categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}

	public String getCategoryImage() {
		return categoryImage;
	}

	public void setCategoryImage(String categoryImage) {
		this.categoryImage = categoryImage;
	}

	@ManyToOne
	@JoinColumn(name="categoryParentId")
	public Category getCategoryParentId() {
		return categoryParentId;
	}

	public void setCategoryParentId(Category categoryParentId) {
		this.categoryParentId = categoryParentId;
	}
}
