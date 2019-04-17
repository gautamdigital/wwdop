package com.shopping.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;
import com.shoping.payment.NewOpenPayOrder;
import com.shoping.payment.OnlineOrderCapturePayment;
import com.shopping.entity.Orders;
import com.shopping.entity.TotalPrice;

public class CheckoutAction extends ActionSupport implements ServletContextAware {
	private static final long serialVersionUID = 1L;
	private ServletContext ctx;
	HttpServletRequest request;
	HttpServletResponse response;
	private Orders orders;
	
	private TotalPrice totalpriceBean;
	
	

	
	

	public TotalPrice getTotalpriceBean() {
		return totalpriceBean;
	}

	public void setTotalpriceBean(TotalPrice totalpriceBean) {
		this.totalpriceBean = totalpriceBean;
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
		
		return SUCCESS;
	}

	@Override
	public void setServletContext(ServletContext context) {
		this.ctx = context;

	}

}
