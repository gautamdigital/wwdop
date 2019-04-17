package com.shopping.dao;

import java.util.List;

import com.shopping.entity.OrderInfo;
import com.shopping.entity.Orderedcarts;

public interface OrderInfoDao {
	
	//public List<OrderInfo>  getAllOrderInfoList();
	
	public int saveOrderinfo(OrderInfo orderinfo);
	
	public List<OrderInfo> getAllOrderInfoList(String planid);
	
	public void updateOrderedinfo(OrderInfo orderinfo);
	
	public List<OrderInfo> fetchAllOrderInfoList();

	

}
