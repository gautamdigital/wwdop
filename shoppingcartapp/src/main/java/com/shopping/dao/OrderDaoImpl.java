package com.shopping.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.shopping.entity.Orders;

public class OrderDaoImpl implements OrdersDao {

	private SessionFactory sf;

	public OrderDaoImpl(SessionFactory sf) {
		this.sf = sf;
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Orders> getAllOrderlist() {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("from orders");

		List<Orders> orderList = query.list();
		tx.commit();
		session.close();
		return orderList;
	}
	
	@Override
	public Orders getOrdersById(int id) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();		
		Orders orders = (Orders) session.get(Orders.class, id);		
		tx.commit();
		session.close();
		return orders;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Orders> getOrders(int user_id) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		Criteria cr = session.createCriteria(Orders.class);
		if(user_id != 0)
		  cr.add(Restrictions.gt("user_id", user_id));
		List<Orders> results = cr.list();
		tx.commit();
		session.close();
		return results;
	}

	@Override
	public int saveOrder(Orders order) {
		System.out.println("order here");
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		boolean isSaved =session.save(order) != null;
		tx.commit();
		session.close();
		if(isSaved)
		 return order.getOrder_id();
		return 0;
	}

}
