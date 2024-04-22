package com.model;

import java.sql.Date;

public class Orders extends Users{
	private int order_id;
	private double total_amount;
	private Date order_date;

	
	public Orders() {}
	
	//constructor without order_id to store in database
	public Orders(int order_id, double total_amount) {
		this.order_id = order_id;
		this.total_amount = total_amount;

	}
	
	//constructor having order_id to get and set the value
	public Orders(double total_amount, Date order_date) {
		this.total_amount = total_amount;
		this.order_date = order_date;
		
	}


	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	


}
