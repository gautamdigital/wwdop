package com.shopping.action;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.util.ServletContextAware;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.shopping.dao.ProductDao;
import com.shopping.dao.ProductDaoImpl;
import com.shopping.entity.Product;

public class ProductAction extends ActionSupport implements ServletContextAware {

	private static final long serialVersionUID = 1L;
	private ServletContext ctx;
	private List<Product> productList;
	private int productId;
	private Product product;
	HttpServletRequest request;
	
	

	public HttpServletRequest getServletRequest() {
		return this.request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	@Override
	public void setServletContext(ServletContext context) {
		this.ctx = context;

	}

	public String listAllProducts() throws Exception {
		SessionFactory sf = (SessionFactory) ctx.getAttribute("SessionFactory");
		ProductDao productDao = new ProductDaoImpl(sf);
		productList = productDao.getAllProductList();
		return "SUCCESS";

	}

	public String productById() throws Exception {
		SessionFactory sf = (SessionFactory) ctx.getAttribute("SessionFactory");
		ProductDao productDao = new ProductDaoImpl(sf);	
		
		System.out.println("product_id ==> " + productId);
		product = productDao.getProductById(productId);

		if (null != product) {
			
			System.out.println("product_id ==> " + product.getProduct_name());
			return "SUCCESS";
		}
		return "ERROR";
	}

}
