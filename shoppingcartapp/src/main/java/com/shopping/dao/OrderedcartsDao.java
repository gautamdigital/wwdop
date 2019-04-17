package com.shopping.dao;

import java.util.List;

import com.shopping.entity.Orderedcarts;

public interface OrderedcartsDao {

	public List<Orderedcarts> getAllOrdercartslist();
	
	public List<Orderedcarts> getOrdercarts(int order_id,int user_id);

	public Orderedcarts getOrderedcartsById(int id);
	
	public void saveOrderedcarts(Orderedcarts orderedcarts);
	

}
