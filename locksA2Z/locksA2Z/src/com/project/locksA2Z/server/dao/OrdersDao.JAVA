package com.project.locksA2Z.server.dao;

import java.util.List;

import com.project.locksA2Z.server.entities.Orders;


public interface OrdersDao extends IAbstractDao<Orders>{
	public Orders getOrdersDetail(String orders);
	public List<Orders> getAllOrderList(String ordered);
	//public Number getCount();

}
