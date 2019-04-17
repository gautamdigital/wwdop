package com.shopping.dao;

import java.util.List;

import com.shopping.entity.Orders;

public interface OrdersDao {
	
	public List<Orders> getAllOrderlist();
	
	public List<Orders> getOrders(int user_id);
	
	public Orders getOrdersById(int id);
	
	public int saveOrder(Orders order);

}
