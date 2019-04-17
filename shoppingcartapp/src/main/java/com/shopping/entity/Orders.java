package com.shopping.entity;

import java.sql.Date;

public class Orders {
	private int order_id;
	private Date order_time;
	private String cust_first_name;
	private String other_names;
	private String cust_last_name;
	private String cust_email;
	private String cust_country;
	private String cust_zip;
	private String cust_state;
	private String cust_city;
	//private String cust_address;
	
	private String purchase_price;
	private String plan_creation_type;
	private String retailer_order_no;
	private String charge_back_count;
	private String customer_quality;	
	private Date dob;
	private String gender;
	private String res_address1;
	private String res_address2;
	private String res_suburb;	
	private String del_address1;
	private String del_address2;
	private String del_suburb;
	private String del_postcode;
	private String del_state;	
	private String tender_name;
	private String amount;	
	private String cust_phone;
	private String cust_fax;
	private String credit_card_type;
	private String card_holder_name;
	private String credit_card_number;
	private Date expiration_date;
	private String customer_notes;
	private String cvv_number;
	private String payment_type;
	private int user_id;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	public String getCust_first_name() {
		return cust_first_name;
	}
	public void setCust_first_name(String cust_first_name) {
		this.cust_first_name = cust_first_name;
	}
	public String getOther_names() {
		return other_names;
	}
	public void setOther_names(String other_names) {
		this.other_names = other_names;
	}
	public String getCust_last_name() {
		return cust_last_name;
	}
	public void setCust_last_name(String cust_last_name) {
		this.cust_last_name = cust_last_name;
	}
	public String getCust_email() {
		return cust_email;
	}
	public void setCust_email(String cust_email) {
		this.cust_email = cust_email;
	}
	public String getCust_country() {
		return cust_country;
	}
	public void setCust_country(String cust_country) {
		this.cust_country = cust_country;
	}
	public String getCust_zip() {
		return cust_zip;
	}
	public void setCust_zip(String cust_zip) {
		this.cust_zip = cust_zip;
	}
	public String getCust_state() {
		return cust_state;
	}
	public void setCust_state(String cust_state) {
		this.cust_state = cust_state;
	}
	public String getCust_city() {
		return cust_city;
	}
	public void setCust_city(String cust_city) {
		this.cust_city = cust_city;
	}
	public String getPurchase_price() {
		return purchase_price;
	}
	public void setPurchase_price(String purchase_price) {
		this.purchase_price = purchase_price;
	}
	public String getPlan_creation_type() {
		return plan_creation_type;
	}
	public void setPlan_creation_type(String plan_creation_type) {
		this.plan_creation_type = plan_creation_type;
	}
	public String getRetailer_order_no() {
		return retailer_order_no;
	}
	public void setRetailer_order_no(String retailer_order_no) {
		this.retailer_order_no = retailer_order_no;
	}
	public String getCharge_back_count() {
		return charge_back_count;
	}
	public void setCharge_back_count(String charge_back_count) {
		this.charge_back_count = charge_back_count;
	}
	public String getCustomer_quality() {
		return customer_quality;
	}
	public void setCustomer_quality(String customer_quality) {
		this.customer_quality = customer_quality;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRes_address1() {
		return res_address1;
	}
	public void setRes_address1(String res_address1) {
		this.res_address1 = res_address1;
	}
	public String getRes_address2() {
		return res_address2;
	}
	public void setRes_address2(String res_address2) {
		this.res_address2 = res_address2;
	}
	public String getRes_suburb() {
		return res_suburb;
	}
	public void setRes_suburb(String res_suburb) {
		this.res_suburb = res_suburb;
	}
	public String getDel_address1() {
		return del_address1;
	}
	public void setDel_address1(String del_address1) {
		this.del_address1 = del_address1;
	}
	public String getDel_address2() {
		return del_address2;
	}
	public void setDel_address2(String del_address2) {
		this.del_address2 = del_address2;
	}
	public String getDel_suburb() {
		return del_suburb;
	}
	public void setDel_suburb(String del_suburb) {
		this.del_suburb = del_suburb;
	}
	public String getDel_postcode() {
		return del_postcode;
	}
	public void setDel_postcode(String del_postcode) {
		this.del_postcode = del_postcode;
	}
	public String getDel_state() {
		return del_state;
	}
	public void setDel_state(String del_state) {
		this.del_state = del_state;
	}
	public String getTender_name() {
		return tender_name;
	}
	public void setTender_name(String tender_name) {
		this.tender_name = tender_name;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getCust_phone() {
		return cust_phone;
	}
	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}
	public String getCust_fax() {
		return cust_fax;
	}
	public void setCust_fax(String cust_fax) {
		this.cust_fax = cust_fax;
	}
	public String getCredit_card_type() {
		return credit_card_type;
	}
	public void setCredit_card_type(String credit_card_type) {
		this.credit_card_type = credit_card_type;
	}
	public String getCard_holder_name() {
		return card_holder_name;
	}
	public void setCard_holder_name(String card_holder_name) {
		this.card_holder_name = card_holder_name;
	}
	public String getCredit_card_number() {
		return credit_card_number;
	}
	public void setCredit_card_number(String credit_card_number) {
		this.credit_card_number = credit_card_number;
	}
	public Date getExpiration_date() {
		return expiration_date;
	}
	public void setExpiration_date(Date expiration_date) {
		this.expiration_date = expiration_date;
	}
	public String getCustomer_notes() {
		return customer_notes;
	}
	public void setCustomer_notes(String customer_notes) {
		this.customer_notes = customer_notes;
	}
	public String getCvv_number() {
		return cvv_number;
	}
	public void setCvv_number(String cvv_number) {
		this.cvv_number = cvv_number;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	
	
	

	
}
