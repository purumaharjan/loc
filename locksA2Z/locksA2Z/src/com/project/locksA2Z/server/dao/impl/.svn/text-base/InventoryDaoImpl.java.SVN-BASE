package com.project.locksA2Z.server.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.orm.jpa.JpaTemplate;
import com.project.locksA2Z.server.dao.InventoryDao;
import com.project.locksA2Z.server.dao.base.AbstractDao;
import com.project.locksA2Z.server.entities.Product;

public class InventoryDaoImpl extends AbstractDao<Product> implements
		InventoryDao {

	protected EntityManager entityManager;
	protected int PAGESIZE=6; 

	public InventoryDaoImpl(JpaTemplate jpaTemplate) {
		super(jpaTemplate);
		setEntityClass(Product.class);	
	}
	@SuppressWarnings("unchecked")
	@Override
	public Product getProductDetails(String productName) {
		List<Product> product = jpaTemplate.find(
				"select p from Product p where p.name=?1", productName);
		if (product.size() == 1) {
			return product.get(0);
		} else
			return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getWithCategoryId(Long id,int pageNumber){
	     entityManager=jpaTemplate.getEntityManagerFactory().createEntityManager(); 
		 @SuppressWarnings("rawtypes")
         TypedQuery sql = entityManager.createQuery("Select p from Product p where p.category.id=?1", Product.class);
		 sql.setParameter(1, id);
		 sql.setFirstResult((pageNumber - 1) * PAGESIZE);
		 sql.setMaxResults(PAGESIZE);
		 List<Product> list= sql.getResultList();
		 return list;
	}
	
	public Integer getCountWithCategoryID(Long id) {
		entityManager=jpaTemplate.getEntityManagerFactory().createEntityManager(); 
		@SuppressWarnings("rawtypes") 
	    TypedQuery sql = entityManager.createQuery("select count(p) as rowcount from Product p where p.category.id=?1", Long.class);
		sql.setParameter(1, id);	
		Long result= (Long) sql.getSingleResult();
		return result.intValue();
	}
}
