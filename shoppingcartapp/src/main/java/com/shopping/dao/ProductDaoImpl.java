package com.shopping.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.shopping.entity.Product;

public class ProductDaoImpl implements ProductDao {
	private SessionFactory sf;

	public ProductDaoImpl(SessionFactory sf) {
		this.sf = sf;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAllProductList() {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("from Product");		
		List<Product> productList = query.list();
		tx.commit();
		session.close();
		return productList;
	}

	@Override
	public Product getProductById(int id) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		
//		String hql = "from Product p where p.product_id = :product_id";
//		Query query = session.createQuery(hql);
//		query.setParameter("product_id", id);
		
		Product product = (Product) session.get(Product.class, id);
		tx.commit();
		session.close();
		return product;
	}
}
