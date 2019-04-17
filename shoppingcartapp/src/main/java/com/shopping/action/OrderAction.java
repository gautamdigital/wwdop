package com.shopping.action;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.util.ServletContextAware;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.shoping.payment.NewOpenPayOrder;
import com.shopping.dao.OrderInfoDao;
import com.shopping.dao.OrderInfoDaoImpl;
import com.shopping.entity.OrderInfo;
import com.shopping.entity.Orders;

public class OrderAction extends ActionSupport implements ServletContextAware {

	private static final long serialVersionUID = 1L;
	private ServletContext ctx;
	HttpServletRequest request;
	HttpServletResponse response;
	private List<OrderInfo> orderinfoList;
	private String url;
	private Orders orders;

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public String getUrl() {
		return url;
	}

	public HttpServletRequest getServletRequest() {
		return this.request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getServletResponse() {
		return this.response;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public String execute() throws Exception {
		// System.out.println("cust_first_name : " + orders.getCust_first_name());
		String planId = "";

		NewOpenPayOrder orderClient = new NewOpenPayOrder();
		SessionFactory sf = (SessionFactory) ctx.getAttribute("SessionFactory");
		planId = orderClient.createOrder(orders, sf);

		String formUrl = "https://retailer.myopenpay.com.au/WebSalesTraining";
		// String formUrl = "https://websales.training.myopenpay.co.uk";

		String JamCallbackURL = "http://localhost:8087/ShoppingCartApp/callback.jsp";
		String JamCancelURL = "http://localhost:8087/ShoppingCartApp/cancel.jsp";
		String JamFailURL = "http://localhost:8087/ShoppingCartApp/faliure.jsp";

		url = formUrl + "?JamPlanID=" + planId + "&JamAuthToken=30000000000000889|155f5b95-a40a-4ae5-8273-41ae83fec8c9"
				+ "&JamCallbackURL=" + JamCallbackURL + "&JamCancelURL=" + JamCancelURL + "&JamFailURL=" + JamFailURL;

		System.out.println(url);
		return "redirect";
	}

	@Override
	public void setServletContext(ServletContext context) {
		this.ctx = context;

	}	

	public List<OrderInfo> getOrderinfoList() {
		return orderinfoList;
	}

	public void setOrderinfoList(List<OrderInfo> orderinfoList) {
		this.orderinfoList = orderinfoList;
	}
	
	
	public String listAllorderinfo() throws Exception {
		SessionFactory sf = (SessionFactory) ctx.getAttribute("SessionFactory");
		OrderInfoDao orderinfodao = new OrderInfoDaoImpl(sf);
		orderinfoList = orderinfodao.getAllOrderInfoList("3000000026196");
		return "SUCCESS";

	}
	
	
	public String fetchAllorderinfo() throws Exception {
		SessionFactory sf = (SessionFactory) ctx.getAttribute("SessionFactory");
		OrderInfoDao orderinfodao = new OrderInfoDaoImpl(sf);
		orderinfoList = orderinfodao.fetchAllOrderInfoList();
		return "SUCCESS";

	}
	

}
