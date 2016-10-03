package com.project.locksA2Z.server.dao.base;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.orm.jpa.JpaTemplate;

import com.project.locksA2Z.server.entities.EntityBase;

public class AbstractDao<T extends EntityBase> {

	protected final JpaTemplate jpaTemplate;
	protected EntityManager entityManager;
	private Class<T> entityClass;
	protected int PAGESIZE = 6; // default value of 6

	public AbstractDao(JpaTemplate jpaTemplate) {
		this.jpaTemplate = jpaTemplate;
		entityManager = jpaTemplate.getEntityManagerFactory().createEntityManager();
	}

	public void setEntityClass(Class<T> entityClass) {
		this.entityClass = entityClass;
	}

	public Class<T> getEntityClass() {
		return entityClass;
	}

	public T findById(Long id) {
		return jpaTemplate.find(entityClass, id);
	}

	@SuppressWarnings("unchecked")
	public List<T> findByName(String name) {
		String query = "SELECT o from " + entityClass.getSimpleName() + " o where o.name=?1";
		return jpaTemplate.find(query, name);
	}

	@SuppressWarnings("unchecked")
	public List<T> getAll() {
		String query = "from " + entityClass.getSimpleName();
		List<T> val = jpaTemplate.find(query);
		return val;
	}

	@SuppressWarnings("unchecked")
	public List<T> getAllWithPaging(int pageNumber) {
		String sql = "from " + entityClass.getSimpleName();
		Query query = entityManager.createQuery(sql);
		query.setFirstResult((pageNumber - 1) * PAGESIZE);
		query.setMaxResults(PAGESIZE);
		List<T> pagedResultList = query.getResultList();
		entityManager.clear();
		return pagedResultList;
	}

	public Integer getCountWithList(List<T> list) {
		return list.size();
	}

	public Integer getCount() {
		String sql = "select count(*) as rowcount from " + entityClass.getSimpleName();
		Query query = entityManager.createQuery(sql);
		Long result = (Long) query.getSingleResult();
		return result.intValue();
	}

	public void deleteById(Long id) {
		jpaTemplate.remove(findById(id));
	}

	public void store(T entity) {
		jpaTemplate.persist(entity);
	}

	public void update(T entity) {
		jpaTemplate.merge(entity);
	}
}
