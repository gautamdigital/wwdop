package com.shoping.payment;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringWriter;

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

import com.shopping.dao.OrderDaoImpl;
import com.shopping.dao.OrderInfoDao;
import com.shopping.dao.OrderInfoDaoImpl;
import com.shopping.dao.OrdersDao;
import com.shopping.entity.OrderInfo;
import com.shopping.entity.Orders;

public class NewOpenPayOrder {

	public String createOrder(Orders orders, SessionFactory sf) {
		System.out.println("in NewOpenPayOrder cust_first_name : " + orders.getCust_first_name());

		String planId = "";
		String orderStatus = "";
		try {
			String url = "https://retailer.myopenpay.com.au/ServiceTraining/JAMServiceImpl.svc/NewOnlineOrder";
			// String url =
			// "https://integration.training.myopenpay.co.uk/JamServiceImpl.svc/NewOnlineOrder";

			CloseableHttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(url);
			// add header
			// post.setHeader("User-Agent", USER_AGENT);
			post.setHeader(HttpHeaders.CONTENT_TYPE, "application/xml");

			OrdersDao ordersDao = new OrderDaoImpl(sf);
			int id = 0;
			if (null != orders) {
				id = ordersDao.saveOrder(orders);
				System.out.println("Generated Id : " + id);
			}
			orders.setRetailer_order_no(String.valueOf(id));
			String input = generateXml(orders);
			System.out.println(input);
			HttpEntity stringEntity = new StringEntity(input, ContentType.APPLICATION_XML);
			post.setEntity(stringEntity);

			HttpResponse response = client.execute(post);
			System.out.println("\nSending 'POST' request to URL : " + url);
			System.out.println("Post parameters : " + post.getEntity());
			System.out.println("Response Code : " + response.getStatusLine().getStatusCode());

			BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			StringBuffer result = new StringBuffer();
			String line = "";
			while ((line = rd.readLine()) != null) {
				result.append(line);
			}

			System.out.println("result ======>  " + result.toString());
			JSONObject xmlJSONObj = XML.toJSONObject(result.toString());
			Object p = xmlJSONObj.getJSONObject("ResponseNewOnlineOrder").get("PlanID");
			planId = String.valueOf(p);
			Object status = xmlJSONObj.getJSONObject("ResponseNewOnlineOrder").get("status");
			orderStatus = String.valueOf(status);

			String openpay_order_id = null;
			String online_order_status = null;
			String new_online_order_capture_status = null;
			String order_approve_status = null;
			String order_dispatch_status = null;
			String order_fraud_alert_status = null;
			Double reduction_amount = null;
			String online_order_reduction_status = null;
			String min_max_purchase_price_status = null;

			if (null != planId) {
				OrderInfo orderinfo = new OrderInfo();

				OrderInfoDao orderinfodao = new OrderInfoDaoImpl(sf);

				orderinfo.setId(id);
				orderinfo.setJam_plan_id(planId);
				orderinfo.setOpenpay_order_id(openpay_order_id);
				orderinfo.setNew_online_order_status(orderStatus);
				orderinfo.setOnline_order_status(online_order_status);
				orderinfo.setOrder_approve_status(order_approve_status);
				orderinfo.setNew_online_order_capture_status(new_online_order_capture_status);
				orderinfo.setReduction_amount(reduction_amount);
				orderinfo.setOnline_order_reduction_status(online_order_reduction_status);
				orderinfo.setOrder_dispatch_status(order_dispatch_status);
				orderinfo.setMin_max_purchase_price_status(min_max_purchase_price_status);
				orderinfo.setOrder_fraud_alert_status(order_fraud_alert_status);

				orderinfodao.saveOrderinfo(orderinfo);
			}

		} catch (Exception ex) {
			System.out.println("Exception ====> " + ex.getMessage());
		}

		return planId;
	}

	private String generateXml(Orders orders) {

		String input = "";
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.newDocument();

			// root element
			Element rootElement = doc.createElement("NewOnlineOrder");
			doc.appendChild(rootElement);

			// jamauthtoken element
			Element jamauthtoken = doc.createElement("JamAuthToken");
			rootElement.appendChild(jamauthtoken);
			jamauthtoken.appendChild(doc.createTextNode("30000000000000889|155f5b95-a40a-4ae5-8273-41ae83fec8c9"));

			// jamtoken element
			Element jamtoken = doc.createElement("JamToken");
			rootElement.appendChild(jamtoken);
			jamtoken.appendChild(doc.createTextNode("30000000000000889"));

			// purchaseprice element
			Element purchaseprice = doc.createElement("PurchasePrice");
			rootElement.appendChild(purchaseprice);
			if (null != orders && null != orders.getPurchase_price()) {
				purchaseprice.appendChild(doc.createTextNode(orders.getPurchase_price()));
			} else {
				purchaseprice.appendChild(doc.createTextNode("0"));
			}

			// PlanCreationType element
			Element plancreationtype = doc.createElement("PlanCreationType");
			rootElement.appendChild(plancreationtype);
			if (null != orders && null != orders.getPlan_creation_type()) {
				plancreationtype.appendChild(doc.createTextNode(orders.getPlan_creation_type()));
			} else {
				plancreationtype.appendChild(doc.createTextNode("NA"));
			}

			// RetailerOrderNo element
			Element retailerOrderNo = doc.createElement("RetailerOrderNo");
			rootElement.appendChild(retailerOrderNo);
			if (null != orders && null != orders.getRetailer_order_no()) {
				retailerOrderNo.appendChild(doc.createTextNode(orders.getRetailer_order_no()));
			} else {
				retailerOrderNo.appendChild(doc.createTextNode("NA"));
			}

			// ChargeBackCount element
			Element chargeBackCount = doc.createElement("ChargeBackCount");
			rootElement.appendChild(chargeBackCount);
			chargeBackCount.appendChild(doc.createTextNode("0"));

			// CustomerQuality element
			Element customerQuality = doc.createElement("CustomerQuality");
			rootElement.appendChild(customerQuality);
			if (null != orders && null != orders.getCustomer_quality())
				customerQuality.appendChild(doc.createTextNode(orders.getCustomer_quality()));
			// customerQuality.appendChild(doc.createTextNode(null));

			// FirstName element
			Element firstName = doc.createElement("FirstName");
			rootElement.appendChild(firstName);
			if (null != orders && null != orders.getCust_first_name())
				firstName.appendChild(doc.createTextNode(orders.getCust_first_name()));
			// firstName.appendChild(doc.createTextNode(null));

			// OtherNames element
			Element otherNames = doc.createElement("OtherNames");
			rootElement.appendChild(otherNames);
			if (null != orders && null != orders.getOther_names())
				otherNames.appendChild(doc.createTextNode(orders.getOther_names()));
			// otherNames.appendChild(doc.createTextNode(null));

			// FamilyName element
			Element familyName = doc.createElement("FamilyName");
			rootElement.appendChild(familyName);
			if (null != orders && null != orders.getCust_last_name())
				familyName.appendChild(doc.createTextNode(orders.getCust_last_name()));
			// familyName.appendChild(doc.createTextNode(null));

			// Email element
			Element email = doc.createElement("Email");
			rootElement.appendChild(email);
			if (null != orders && null != orders.getCust_email())
				email.appendChild(doc.createTextNode(orders.getCust_email()));
			// email.appendChild(doc.createTextNode(null));

			// DateOfBirth element
			Element dateOfBirth = doc.createElement("DateOfBirth");
			rootElement.appendChild(dateOfBirth);
			if (null != orders && null != orders.getDob())
				dateOfBirth.appendChild(doc.createTextNode("10May 1980"));

			// Gender element
			Element gender = doc.createElement("Gender");
			rootElement.appendChild(gender);
			if (null != orders && null != orders.getGender())
				gender.appendChild(doc.createTextNode(orders.getGender()));
			// gender.appendChild(doc.createTextNode(null));

			// PhoneNumber element
			Element phoneNumber = doc.createElement("PhoneNumber");
			rootElement.appendChild(phoneNumber);
			if (null != orders && null != orders.getCust_phone())
				phoneNumber.appendChild(doc.createTextNode(orders.getCust_phone()));
			// phoneNumber.appendChild(doc.createTextNode(null));

			// ResAddress1 element
			Element resAddress1 = doc.createElement("ResAddress1");
			rootElement.appendChild(resAddress1);
			if (null != orders && null != orders.getRes_address1())
				resAddress1.appendChild(doc.createTextNode(orders.getRes_address1()));
			// resAddress1.appendChild(doc.createTextNode(""));

			// ResAddress2 element
			Element resAddress2 = doc.createElement("ResAddress2");
			rootElement.appendChild(resAddress2);
			if (null != orders && null != orders.getRes_address2())
				resAddress2.appendChild(doc.createTextNode(orders.getRes_address2()));
			// resAddress2.appendChild(doc.createTextNode(null));

			// ResSuburb element
			Element resSuburb = doc.createElement("ResSuburb");
			rootElement.appendChild(resSuburb);
			if (null != orders && null != orders.getRes_suburb())
				resSuburb.appendChild(doc.createTextNode(orders.getRes_suburb()));
			// resSuburb.appendChild(doc.createTextNode(null));

			// ResState element
			Element resState = doc.createElement("ResState");
			rootElement.appendChild(resState);
			if (null != orders && null != orders.getCust_state())
				resState.appendChild(doc.createTextNode(orders.getCust_state()));
			// resState.appendChild(doc.createTextNode(null));

			// ResPostCode element
			Element resPostCode = doc.createElement("ResPostCode");
			rootElement.appendChild(resPostCode);
			if (null != orders && null != orders.getCust_zip())
				resPostCode.appendChild(doc.createTextNode(orders.getCust_zip()));
			// resPostCode.appendChild(doc.createTextNode(null));

			// DelAddress1 element
			Element delAddress1 = doc.createElement("DelAddress1");
			rootElement.appendChild(delAddress1);
			if (null != orders && null != orders.getDel_address1())
				delAddress1.appendChild(doc.createTextNode(orders.getDel_address1()));
			// delAddress1.appendChild(doc.createTextNode(null));

			// DelAddress2 element
			Element delAddress2 = doc.createElement("DelAddress2");
			rootElement.appendChild(delAddress2);
			if (null != orders && null != orders.getDel_address2())
				delAddress2.appendChild(doc.createTextNode(orders.getDel_address2()));
			// delAddress2.appendChild(doc.createTextNode(null));

			// DelSuburb element
			Element delSuburb = doc.createElement("DelSuburb");
			rootElement.appendChild(delSuburb);
			if (null != orders && null != orders.getDel_suburb())
				delSuburb.appendChild(doc.createTextNode(orders.getDel_suburb()));
			// delSuburb.appendChild(doc.createTextNode(null));

			// DelState element
			Element delState = doc.createElement("DelState");
			rootElement.appendChild(delState);
			if (null != orders && null != orders.getDel_state())
				delState.appendChild(doc.createTextNode(orders.getDel_state()));
			// delState.appendChild(doc.createTextNode(null));

			// DelPostCode element
			Element delPostCode = doc.createElement("DelPostCode");
			rootElement.appendChild(delPostCode);
			if (null != orders && null != orders.getDel_postcode())
				delPostCode.appendChild(doc.createTextNode(orders.getDel_postcode()));
			// delPostCode.appendChild(doc.createTextNode(null));

			// BasketData element
			Element basketdata = doc.createElement("BasketData");
			rootElement.appendChild(basketdata);

			// setting attribute to element
			// Attr attr = doc.createAttribute("company");
			// attr.setValue("Ferrari");
			// supercar.setAttributeNode(attr);

			// BasketData element
			Element basketitem = doc.createElement("BasketItem");
			basketdata.appendChild(basketitem);

			// carname element
			Element itemname = doc.createElement("ItemName");
			// Attr attrType = doc.createAttribute("type");
			// attrType.setValue("formula one");
			// carname.setAttributeNode(attrType);
			itemname.appendChild(doc.createTextNode("Ferrari 101"));
			basketitem.appendChild(itemname);

			Element itemgroup = doc.createElement("ItemGroup");
			// Attr attrType1 = doc.createAttribute("type");
			// attrType1.setValue("sports");
			// carname1.setAttributeNode(attrType1);
			itemgroup.appendChild(doc.createTextNode("Ferrari 202"));
			basketitem.appendChild(itemgroup);

			// Itemcode Element
			Element itemcode = doc.createElement("Itemcode");
			itemcode.appendChild(doc.createTextNode("1234567890"));
			basketitem.appendChild(itemcode);

			// ItemGroupcode
			Element itemgropucode = doc.createElement("ItemGroupcode");
			itemgropucode.appendChild(doc.createTextNode("F123"));
			basketitem.appendChild(itemgropucode);

			// ItemRetailUnitPrice
			Element itemretailunitprice = doc.createElement("ItemRetailUnitPrice");
			itemretailunitprice.appendChild(doc.createTextNode("123.00"));
			basketitem.appendChild(itemretailunitprice);

			// ItemQty
			Element itemqty = doc.createElement("ItemQty");
			itemqty.appendChild(doc.createTextNode("4"));
			basketitem.appendChild(itemqty);

			// ItemRetailCharge
			Element itemretailcharge = doc.createElement("ItemRetailCharge");
			itemretailcharge.appendChild(doc.createTextNode("122.03"));
			basketitem.appendChild(itemretailcharge);

			// TenderTypes element
			Element tendertypes = doc.createElement("TenderTypes");
			rootElement.appendChild(tendertypes);

			// TenderType element
			Element tendertype = doc.createElement("TenderType");
			tendertypes.appendChild(tendertype);

			// Tender
			Element tender = doc.createElement("Tender");
			if (null != orders && null != orders.getTender_name())
				tender.appendChild(doc.createTextNode(orders.getTender_name()));
			// tender.appendChild(doc.createTextNode(null));
			tendertype.appendChild(tender);

			// Amount
			Element amount = doc.createElement("Amount");
			amount.appendChild(doc.createTextNode("100.00"));
			tendertype.appendChild(amount);

			// write the content into xml file
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			DOMSource source = new DOMSource(doc);
			StringWriter writer = new StringWriter();
			StreamResult result = new StreamResult(writer);
			transformer.transform(source, result);
			input = writer.toString();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return input;

	}

}
