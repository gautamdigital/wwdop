package com.shopping.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.shopping.entity.Users;

public class UsersDaoImpl implements UsersDao {

	private SessionFactory sf;

	public UsersDaoImpl(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public Users getUserByCredentials(String user_name, String password) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("from Users where user_name=:user_name and password=:password");
		query.setString("user_name", user_name);
		query.setString("password", password);
		Users user = (Users) query.uniqueResult();
		if (user != null) {
			System.out.println("User Retrieved from DB::" + user);
		}
		tx.commit();
		session.close();
		return user;
	}

	@Override
	public Users getUserById(int id) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();

//		String hql = "from Product p where p.product_id = :product_id";
//		Query query = session.createQuery(hql);
//		query.setParameter("product_id", id);

		Users users = (Users) session.get(Users.class, id);
		tx.commit();
		session.close();
		return users;
	}
	
	
	public void saveUser(Users users) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(users);
		tx.commit();
		session.close();
		
	}

}
