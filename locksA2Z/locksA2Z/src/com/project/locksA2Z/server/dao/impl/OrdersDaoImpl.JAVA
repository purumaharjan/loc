package com.project.locksA2Z.server.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.orm.jpa.JpaTemplate;

import com.project.locksA2Z.server.dao.OrdersDao;
import com.project.locksA2Z.server.dao.base.AbstractDao;
import com.project.locksA2Z.server.entities.Orders;

public class OrdersDaoImpl extends AbstractDao<Orders> implements OrdersDao  {
	protected EntityManager em;
	@SuppressWarnings("unused")
	private int PAGESIZE=5;
	
	public OrdersDaoImpl(JpaTemplate jpaTemplate){
		super(jpaTemplate);
		setEntityClass(Orders.class);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Orders getOrdersDetail(String order) {

		List<Orders> orders = jpaTemplate.find(
				"select o from Orders o where o.orderDeliveryFirstname=?1", order);
		if (orders.size() == 1) {
			return orders.get(0);
		} else
			return null; // implement database data error exception
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Orders> getAllOrderList(String ordered){
    
		//String query = "Select o from Orders o where o.orderStatus = ?1",ordered);
	    em=jpaTemplate.getEntityManagerFactory().createEntityManager(); 
	   // Query sql=em.createQuery(query);
	    TypedQuery sql = em.createQuery("select o from Orders o where o.orderStatus = ?1", Orders.class);
	    sql.setParameter(1, ordered);
	    //sql.setFirstResult(147);
	    sql.setMaxResults(3);
	    List<Orders> list= sql.getResultList();
	    return list;
    }
	
//	public Number getCount(){
//		em=jpaTemplate.getEntityManagerFactory().createEntityManager(); 
//	    Query query=em.createQuery("select count(*) as rowcount from Orders");
//	    Number cResults=(Number) query.getSingleResult();
//	    return cResults;
//	}

}
