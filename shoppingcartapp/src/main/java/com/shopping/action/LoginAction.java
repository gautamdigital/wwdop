package com.shopping.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shopping.dao.UsersDao;
import com.shopping.dao.UsersDaoImpl;
import com.shopping.entity.Users;
import com.shopping.util.JsonConverter;

public class LoginAction extends ActionSupport implements ServletContextAware, ServletResponseAware {

	private static final long serialVersionUID = 1L;
	private ServletContext ctx;
	private Users user;
	private Map<String, String> maps = new HashMap<String, String>();
	private String user_name;
	private String password;
	HttpServletRequest request;
	HttpServletResponse response;

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public Map<String, String> getMaps() {
		return maps;
	}

	public void setMaps(Map<String, String> maps) {
		this.maps = maps;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
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

	public HttpServletRequest getServletRequest() {
		return this.request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletContext(ServletContext context) {
		this.ctx = context;

	}

	Map<String, Object> session = null;

	public void checkUser() throws Exception {

		SessionFactory sf = (SessionFactory) ctx.getAttribute("SessionFactory");
		UsersDao usersDao = new UsersDaoImpl(sf);
		user = usersDao.getUserByCredentials(user_name, password);

		if (null != user) {
			maps.put("code", "0");
			maps.put("msg", "Authentication Success");
			maps.put("user", JsonConverter.objToJsonString(user));

			session = ActionContext.getContext().getSession();
			session.put("user", user);
			session.put("userName", user.getUser_name());
			session.put("userId", user.getId());
			System.out.println("user_id ====> " + session.get("user_id"));
		} else {
			session = null;
			maps.put("code", "1");
			maps.put("msg", "Authentication failed");
		}

		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");
		try {
			response.getWriter().write(JsonConverter.objToJsonString(maps));
		} catch (Exception ioe) {
			ioe.printStackTrace();
		}
	}

//	@Override
//	public void setSession(Map<String, Object> session) {
//		if (null != user) {
//			session.put("user", user);
//			session.put("user_id", user.getId());
//		}
//
//	}

}
