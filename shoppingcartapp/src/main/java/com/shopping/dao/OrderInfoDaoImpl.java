package com.shopping.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.shopping.entity.OrderInfo;
import com.shopping.entity.Orders;

public class OrderInfoDaoImpl implements OrderInfoDao {

	private SessionFactory sf;

	public OrderInfoDaoImpl(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public int saveOrderinfo(OrderInfo orderinfo) {
		System.out.println("order info here");
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		boolean isSaved = session.save(orderinfo) != null;
		tx.commit();
		session.close();
		if (isSaved)
			return orderinfo.getId();
		return 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderInfo> getAllOrderInfoList(String planid) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		Criteria cr = session.createCriteria(OrderInfo.class);
		if (planid != "0") {
			cr.add(Restrictions.eq("jam_plan_id", planid));

		}
		List<OrderInfo> results = cr.list();

		tx.commit();
		session.close();
		return results;
	}

	public void updateOrderedinfo(OrderInfo orderinfo) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(orderinfo);
		tx.commit();
		session.close();

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderInfo> fetchAllOrderInfoList() {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		Criteria cr = session.createCriteria(OrderInfo.class);
		/*
		 * if (planid != "0") { cr.add(Restrictions.eq("jam_plan_id", planid));
		 * 
		 * }
		 */
		List<OrderInfo> results = cr.list();

		tx.commit();
		session.close();
		return results;
	}

}
