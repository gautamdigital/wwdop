package com.shopping.dao;

import java.util.List;

import com.shopping.entity.Product;

public interface ProductDao {
	public List<Product> getAllProductList();
	public Product getProductById(int id);
	
	
}
