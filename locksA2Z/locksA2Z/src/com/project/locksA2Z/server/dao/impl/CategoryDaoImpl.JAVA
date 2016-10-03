package com.project.locksA2Z.server.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.springframework.orm.jpa.JpaTemplate;

import com.project.locksA2Z.server.dao.CategoryDao;
import com.project.locksA2Z.server.dao.base.AbstractDao;
import com.project.locksA2Z.server.entities.Category;

public class CategoryDaoImpl extends AbstractDao<Category> implements CategoryDao {

	public CategoryDaoImpl(JpaTemplate jpaTemplate) {
		super(jpaTemplate);
		setEntityClass(Category.class);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Category> getSubCategoryById(Long categoryId) {
		List<Category> subCategories = jpaTemplate.find("SELECT s FROM Category s WHERE s.categoryParentId.id=?1", categoryId);
		return subCategories;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Category> getAllCategories() {
		List<Category> categories = jpaTemplate.find("SELECT c FROM Category c WHERE c.categoryParentId.id=NULL");
		return categories;
	}

	@SuppressWarnings("unchecked")
	public List<Category> getAllCategoryWithPaging(int pageNumber, Long parentId) {
		String sql = (parentId==null)?"SELECT c FROM Category c WHERE c.categoryParentId.id=NULL":"SELECT c FROM Category c WHERE c.categoryParentId.id="+parentId.toString();
		Query query = entityManager.createQuery(sql);
		query.setFirstResult((pageNumber - 1) * PAGESIZE);
		query.setMaxResults(PAGESIZE);
		List<Category> pagedResultSet = query.getResultList();
		entityManager.clear();
		for(Category category:pagedResultSet)
		{
			System.out.println(category.getName());
		}
		return pagedResultSet;
	}
	
	@Override
	public Long getCategoryCount(Long parentId){
		String sql = (parentId==null)?"SELECT COUNT(c.id) FROM Category c WHERE c.categoryParentId.id=NULL":"SELECT COUNT(c) FROM Category c WHERE c.categoryParentId.id="+parentId.toString();
		Query query=entityManager.createQuery(sql);
		return (Long)query.getSingleResult();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Category> getAllLeafCategories() {
		List<Category> leafCategories = jpaTemplate
				.find("SELECT c FROM Category c WHERE c.id NOT IN (SELECT c.categoryParentId.id FROM Category c WHERE c.categoryParentId.id IS NOT NULL) AND c.id NOT IN(SELECT c FROM Category c WHERE c.categoryParentId.id=NULL)");
		return leafCategories;
	}

	@Override
	public List<Category> getAllParentIds(Long categoryId) {
		List<Category> categories = new ArrayList<Category>();
		boolean flag = true;
		boolean first = true;
		while (flag) {
			Category buffer = this.findById(categoryId);
			if (!first)
				categories.add(buffer);
			first = false;
			if (buffer.getCategoryParentId() == null)
				flag = false;
			else
				categoryId = buffer.getCategoryParentId().getId();
		}
		List<Category> reverseCategories = new ArrayList<Category>();
		for (int i = categories.size() - 1; i >= 0; i--)
			reverseCategories.add(categories.get(i));
		return reverseCategories;
	}
}
