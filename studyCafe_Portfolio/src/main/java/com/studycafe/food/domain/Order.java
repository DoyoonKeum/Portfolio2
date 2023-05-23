package com.studycafe.food.domain;

import java.sql.Timestamp;

public class Order {
	
	private String oreder_no;
	private int u_number;
	private Timestamp order_time;
	private int order_price;
	private int call_no;
	
	private int od_no;
	private int food_no;
	private int quantity;
	
	
	public Order() {
	}


	public String getOreder_no() {
		return oreder_no;
	}


	public void setOreder_no(String oreder_no) {
		this.oreder_no = oreder_no;
	}


	public int getU_number() {
		return u_number;
	}


	public void setU_number(int u_number) {
		this.u_number = u_number;
	}


	public Timestamp getOrder_time() {
		return order_time;
	}


	public void setOrder_time(Timestamp order_time) {
		this.order_time = order_time;
	}


	public int getOrder_price() {
		return order_price;
	}


	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}


	public int getCall_no() {
		return call_no;
	}


	public void setCall_no(int call_no) {
		this.call_no = call_no;
	}


	public int getOd_no() {
		return od_no;
	}


	public void setOd_no(int od_no) {
		this.od_no = od_no;
	}


	public int getFood_no() {
		return food_no;
	}


	public void setFood_no(int food_no) {
		this.food_no = food_no;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	@Override
	public String toString() {
		return "Order [oreder_no=" + oreder_no + ", u_number=" + u_number + ", order_time=" + order_time
				+ ", order_price=" + order_price + ", call_no=" + call_no + ", od_no=" + od_no + ", food_no=" + food_no
				+ ", quantity=" + quantity + "]";
	}
	
	
}
