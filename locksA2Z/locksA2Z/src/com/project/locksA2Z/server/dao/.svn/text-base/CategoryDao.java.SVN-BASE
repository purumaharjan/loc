package com.project.locksA2Z.server.dao;

import java.util.List;

import com.project.locksA2Z.server.entities.Category;

public interface CategoryDao  extends IAbstractDao<Category> {
	public List<Category> getSubCategoryById(Long categoryId);
	public List<Category> getAllCategories();
	public List<Category> getAllLeafCategories();
	public List<Category> getAllParentIds(Long categoryId);
	public List<Category> getAllCategoryWithPaging(int pageNumber,Long parentId);
	public Long getCategoryCount(Long parentId);
}
