package com.shopping.dao;

import java.util.List;

import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.shopping.entity.Category;

public class CategoryDaoImpl implements CategoryDao {

	private SessionFactory sf;

	public CategoryDaoImpl(SessionFactory sf) {
		this.sf = sf;
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Category> getAllCategoryList() {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("from category");

		List<Category> categoryList = query.list();
		tx.commit();
		session.close();
		return categoryList;
	}

	@Override
	public Category getcategoryById(int id) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();

		Category category = (Category) session.get(Category.class, id);
		tx.commit();
		session.close();
		return category;
	}

}
