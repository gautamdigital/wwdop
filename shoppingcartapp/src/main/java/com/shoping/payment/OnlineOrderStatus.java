package com.shoping.payment;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.struts2.util.ServletContextAware;
import org.hibernate.SessionFactory;
import org.json.JSONObject;
import org.json.XML;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.opensymphony.xwork2.ActionSupport;
import com.shopping.dao.OrderInfoDao;
import com.shopping.dao.OrderInfoDaoImpl;
import com.shopping.entity.OrderInfo;

public class OnlineOrderStatus extends ActionSupport implements ServletContextAware {

	private static final long serialVersionUID = 1L;

	private ServletContext ctx;
	HttpServletRequest request;
	HttpServletResponse response;
	private String planid;
	private Map<String, String> maps = new HashMap<String, String>();

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

	@Override
	public void setServletContext(ServletContext context) {
		this.ctx = context;

	}

	public String getPlanid() {
		return planid;
	}

	public void setPlanid(String planid) {
		this.planid = planid;
	}

	public void onlineOrderStatus() {
		StringBuffer result = null;
		System.out.println("-----IN order Status------> " + planid);
		try {
			String url = "https://retailer.myopenpay.com.au/ServiceTraining/JAMServiceImpl.svc/OnlineOrderStatus";
			// String url =
			// "https://integration.training.myopenpay.co.uk/JamServiceImpl.svc/OnlineOrderStatus";
			CloseableHttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(url);
			// add header
			// post.setHeader("User-Agent", USER_AGENT);
			post.setHeader(HttpHeaders.CONTENT_TYPE, "application/xml");

			String input = generateOnlineOrderStatusXml(planid);
			HttpEntity stringEntity = new StringEntity(input, ContentType.APPLICATION_XML);
			post.setEntity(stringEntity);

			HttpResponse response = client.execute(post);
			System.out.println("\nSending 'POST' request to URL : " + url);
			System.out.println("Post parameters : " + post.getEntity());
			System.out.println("Response Code : " + response.getStatusLine().getStatusCode());

			BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));

			result = new StringBuffer();
			String line = "";
			while ((line = rd.readLine()) != null) {
				result.append(line);
			}

			System.out.println("Response onlineorder staatus --- > " + result.toString());
			JSONObject xmlJSONObj = XML.toJSONObject(result.toString());
			System.out.println(xmlJSONObj.toString());
			Object orderStatus = xmlJSONObj.getJSONObject("ResponseOnlineOrderStatus").get("OrderStatus");
			String onlineorderStatus = String.valueOf(orderStatus);
			
			Object status = xmlJSONObj.getJSONObject("ResponseOnlineOrderStatus").get("status");
			String resonlineStatus = String.valueOf(status);
			
			System.out.println("Approve status: "+onlineorderStatus);
			
			
			
			if (null != planid) {

				// OrderInfo orderinfo = new OrderInfo();
				SessionFactory sf = (SessionFactory) ctx.getAttribute("SessionFactory");

				OrderInfoDao orderinfodao = new OrderInfoDaoImpl(sf);

				List<OrderInfo> list = orderinfodao.getAllOrderInfoList(planid);

				int size = list.size();
				if (size == 1) {
					OrderInfo orderinfo = list.get(0);
					orderinfo.setOnline_order_status(resonlineStatus);
					orderinfo.setOrder_approve_status(onlineorderStatus);

					orderinfodao.updateOrderedinfo(orderinfo); // update

				}				
				maps.put("code", "0");
				maps.put("msg", "Success");
			} else {
				maps.put("code", "1");
				maps.put("msg", "Error");
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}

	}

	private static String generateOnlineOrderStatusXml(String planId) {

		String input = "";
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.newDocument();

			// root element
			Element rootElement = doc.createElement("OnlineOrderStatus");
			doc.appendChild(rootElement);

			// jamauthtoken element
			Element jamauthtoken = doc.createElement("JamAuthToken");
			rootElement.appendChild(jamauthtoken);
			jamauthtoken.appendChild(doc.createTextNode("30000000000000889|155f5b95-a40a-4ae5-8273-41ae83fec8c9"));

			// jamtoken element
			Element jamtoken = doc.createElement("JamToken");
			rootElement.appendChild(jamtoken);
			jamtoken.appendChild(doc.createTextNode("30000000000000889"));

			// planId element
			Element PlanID = doc.createElement("PlanID");
			rootElement.appendChild(PlanID);
			PlanID.appendChild(doc.createTextNode(planId));

			// write the content into xml file
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			DOMSource source = new DOMSource(doc);
			StringWriter writer = new StringWriter();
			StreamResult result = new StreamResult(writer);
			transformer.transform(source, result);
			input = writer.toString();
			System.out.println("request parameter");
			System.out.println(input);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return input;

	}

}
