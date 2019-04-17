package com.shopping.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.util.ServletContextAware;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.shopping.dao.UsersDao;
import com.shopping.dao.UsersDaoImpl;
import com.shopping.entity.Users;

public class UserAction extends ActionSupport implements ServletContextAware {
	private static final long serialVersionUID = 1L;
	private ServletContext ctx;
	private Users user;
	HttpServletRequest request;
	private String user_name;
	private String password;
	private String first_name;
	private String last_name;
	private String email;
	private String country;
	private String zip;
	private String state;
	private String city;
	private String address;
	private String phone;
	private int fax;

	private int userId;

	private Map<String, String> maps = new HashMap<String, String>();

	public Map<String, String> getMaps() {
		return maps;
	}

	public void setMaps(Map<String, String> maps) {
		this.maps = maps;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getFax() {
		return fax;
	}

	public void setFax(int fax) {
		this.fax = fax;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	@Override
	public void setServletContext(ServletContext context) {
		this.ctx = context;

	}

	public Map<String, String> saveUsers() throws Exception {

		SessionFactory sf = (SessionFactory) ctx.getAttribute("SessionFactory");
		UsersDao userDao = new UsersDaoImpl(sf);
		user = new Users();
		user.setUser_name(user_name);
		user.setPassword(password);
		user.setFirst_name(first_name);
		user.setLast_name(last_name);
		user.setEmail(email);
		user.setCountry(country);
		user.setZip(zip);
		user.setState(state);
		user.setCity(city);
		user.setAddress(address);
		user.setFax(fax);
		user.setPhone(phone);
		userDao.saveUser(user);

		maps.put("code", "0");
		maps.put("msg", "User added successfully");

		return maps;

	}

	public String getById() throws Exception {
		SessionFactory sf = (SessionFactory) ctx.getAttribute("SessionFactory");
		UsersDao userDao = new UsersDaoImpl(sf);
		System.out.println("userId ==> " + userId);
		user = userDao.getUserById(userId);

		if (null != user) {

			System.out.println("userId ==> " + user.getUser_name());
			return "SUCCESS";
		}
		return "ERROR";
	}

}
