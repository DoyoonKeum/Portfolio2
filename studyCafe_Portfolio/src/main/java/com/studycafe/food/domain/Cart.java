package com.studycafe.food.domain;

public class Cart {
	
	private int cart_no;
	private int u_number;
	private int food_no;
	private int quantity;
	
	private String food_name;
	private int food_price;
	
	public Cart() {}
	
	public Cart(int u_number, int food_no) {
		this.u_number = u_number;
		this.food_no = food_no;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getU_number() {
		return u_number;
	}

	public void setU_number(int u_number) {
		this.u_number = u_number;
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

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public int getFood_price() {
		return food_price;
	}

	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}

	@Override
	public String toString() {
		return "Cart [cart_no=" + cart_no + ", u_number=" + u_number + ", food_no=" + food_no + ", quantity="
				+ quantity + ", food_name=" + food_name + ", food_price=" + food_price + "]";
	}

	

	
	
	

}
