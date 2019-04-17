package com.shopping.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.util.ServletContextAware;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.shopping.dao.OrderedcartsDao;
import com.shopping.dao.OrderedcartsDaoImpl;
import com.shopping.entity.Orderedcarts;
import com.shopping.entity.Orders;
import com.shopping.entity.TotalPrice;

public class CartAction extends ActionSupport implements ServletContextAware {

	private static final long serialVersionUID = 1L;
	private ServletContext ctx;
	private List<Orderedcarts> cartList;
	private Orderedcarts cart;
	HttpServletRequest request;
	private int order_id;
	private int user_id;
	private Map<String, String> maps = new HashMap<String, String>();
	
	
	private int product_id;
	private String product_name;
	private double price;
	private int quantity;
	private String status;
	
	private TotalPrice totalPrice;

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public Map<String, String> getMaps() {
		return maps;
	}

	public void setMaps(Map<String, String> maps) {
		this.maps = maps;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public List<Orderedcarts> getCartList() {
		return cartList;
	}

	public void setCartList(List<Orderedcarts> cartList) {
		this.cartList = cartList;
	}

	public Orderedcarts getCart() {
		return cart;
	}

	public void setCart(Orderedcarts cart) {
		this.cart = cart;
	}

	public HttpServletRequest getServletRequest() {
		return this.request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	@Override
	public void setServletContext(ServletContext context) {
		this.ctx = context;

	}

	public String listcarts() throws Exception {
		System.out.println(order_id+" --- "+user_id);
		SessionFactory sf = (SessionFactory) ctx.getAttribute("SessionFactory");
		OrderedcartsDao cartDao = new OrderedcartsDaoImpl(sf);
		cartList = cartDao.getOrdercarts(order_id, user_id);
		if(null != cartList)
		   System.out.println(cartList.size());
		return "SUCCESS";
	}

	public Map<String, String> savecarts() throws Exception {
		SessionFactory sf = (SessionFactory) ctx.getAttribute("SessionFactory");
		OrderedcartsDao cartDao = new OrderedcartsDaoImpl(sf);
		cart = new Orderedcarts();
		cart.setPrice(price);
		cart.setProduct_id(product_id);
		cart.setProduct_name(product_name);
		cart.setStatus(status);
		cart.setUser_id(user_id);
		cart.setQuantity(quantity);
		
		System.out.println("price == > "+ price);
		cartDao.saveOrderedcarts(cart);
		maps.put("code", "0");
		maps.put("msg", "item has been added to cart");
		return maps;
	}

}
