package com.project.locksA2Z.server.dao;

import java.util.List;


import com.project.locksA2Z.server.entities.Product;

public interface InventoryDao extends IAbstractDao<Product>{
	public Product getProductDetails (String productName);
	public List<Product> getWithCategoryId(Long id,int paging);
	public Integer getCountWithCategoryID(Long id);
}