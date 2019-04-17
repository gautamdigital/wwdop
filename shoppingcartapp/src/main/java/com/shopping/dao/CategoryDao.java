package com.shopping.dao;

import java.util.List;

import com.shopping.entity.Category;

public interface CategoryDao {
	
	public List<Category> getAllCategoryList();

	public Category getcategoryById(int id);

}
