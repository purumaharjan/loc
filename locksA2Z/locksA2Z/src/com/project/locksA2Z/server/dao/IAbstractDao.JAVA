package com.project.locksA2Z.server.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface IAbstractDao<T> {
	public T findById(Long id);
	public List<T> getAll();
	public void deleteById(Long id);
	public void store(T entity);
	public void setEntityClass(Class<T> entityClass);
	public Class<T> getEntityClass();
	public void update(T entity);
	public List<T> findByName(String name);
	public List<T> getAllWithPaging(int pageNumber);
	public Integer getCount();
	public Integer getCountWithList(List<T> list);
}