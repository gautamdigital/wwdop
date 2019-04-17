package com.shopping.dao;

import com.shopping.entity.Product;
import com.shopping.entity.Users;

public interface UsersDao {

	Users getUserByCredentials(String user_name, String password);
	
	
	public Users getUserById(int id);


	public void saveUser(Users user);
	
}
