package com.shopping.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.shopping.entity.Orderedcarts;
import com.shopping.entity.Orders;

public class OrderedcartsDaoImpl implements OrderedcartsDao {

	private SessionFactory sf;

	public OrderedcartsDaoImpl(SessionFactory sf) {
		this.sf = sf;
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Orderedcarts> getAllOrdercartslist() {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("from orderedcarts");

		List<Orderedcarts> ordercartList = query.list();
		tx.commit();
		session.close();
		return ordercartList;
	}

	@Override
	public Orderedcarts getOrderedcartsById(int id) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();

		Orderedcarts ordercartList = (Orderedcarts) session.get(Orderedcarts.class, id);
		tx.commit();
		session.close();
		return ordercartList;
	}

	public void saveOrderedcarts(Orderedcarts orderedcarts) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(orderedcarts);
		tx.commit();
		session.close();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Orderedcarts> getOrdercarts(int order_id, int user_id) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		Criteria cr = session.createCriteria(Orderedcarts.class);
		if(order_id != 0)
		  cr.add(Restrictions.eq("order_id", order_id));
		if(user_id != 0)
			  cr.add(Restrictions.eq("user_id", user_id));
		List<Orderedcarts> results = cr.list();

		tx.commit();
		session.close();
		return results;
	}

}
