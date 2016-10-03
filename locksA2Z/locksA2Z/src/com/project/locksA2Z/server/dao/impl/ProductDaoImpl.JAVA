package com.project.locksA2Z.server.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.orm.jpa.JpaTemplate;

import com.project.locksA2Z.server.dao.ProductDao;
import com.project.locksA2Z.server.dao.base.AbstractDao;
import com.project.locksA2Z.server.entities.Category;
import com.project.locksA2Z.server.entities.Product;


public class ProductDaoImpl extends AbstractDao<Product> implements ProductDao {
	
	protected EntityManager em;
	public ProductDaoImpl(JpaTemplate jpaTemplate) {
		super(jpaTemplate);
		setEntityClass(Product.class);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Product> getWithCategoryId(Long id){
		    em = jpaTemplate.getEntityManagerFactory().createEntityManager();
		    TypedQuery sql = em.createQuery("select p from Product p where p.category.id = :id", Product.class);
		    sql.setParameter("id", id);
		    List<Product> list = sql.getResultList();
		    em.clear();
		    return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getAllProductCategoryId() {
		List<Category> categories=jpaTemplate.find("SELECT p.category FROM Product p");
		return categories;
	}

}
