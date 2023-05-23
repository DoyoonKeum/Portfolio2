package com.studycafe.reservation.domain;


public class RoomReservation {

	private int rs_number;
	private int u_number;
	private int r_number;
	private String rs_date;
	private String rs_time1;
	private String rs_time2;
	private String rs_time3;
	private String rs_time4;
	private String rs_time5;
	private String rs_time6;
	private String u_name;
	private int r_price;
	private int rs_price;
	private String u_tell;
	
	public int getRs_number() {
		return rs_number;
	}
	public void setRs_number(int rs_number) {
		this.rs_number = rs_number;
	}
	public int getU_number() {
		return u_number;
	}
	public void setU_number(int u_number) {
		this.u_number = u_number;
	}
	public int getR_number() {
		return r_number;
	}
	public void setR_number(int r_number) {
		this.r_number = r_number;
	}
	public String getRs_date() {
		return rs_date;
	}
	public void setRs_date(String rs_date) {
		this.rs_date = rs_date;
	}
	public String getRs_time1() {
		return rs_time1;
	}
	public void setRs_time1(String rs_time1) {
		this.rs_time1 = rs_time1;
	}
	public String getRs_time2() {
		return rs_time2;
	}
	public void setRs_time2(String rs_time2) {
		this.rs_time2 = rs_time2;
	}
	public String getRs_time3() {
		return rs_time3;
	}
	public void setRs_time3(String rs_time3) {
		this.rs_time3 = rs_time3;
	}
	public String getRs_time4() {
		return rs_time4;
	}
	public void setRs_time4(String rs_time4) {
		this.rs_time4 = rs_time4;
	}
	public String getRs_time5() {
		return rs_time5;
	}
	public void setRs_time5(String rs_time5) {
		this.rs_time5 = rs_time5;
	}
	public String getRs_time6() {
		return rs_time6;
	}
	public void setRs_time6(String rs_time6) {
		this.rs_time6 = rs_time6;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public int getR_price() {
		return r_price;
	}
	public void setR_price(int r_price) {
		this.r_price = r_price;
	}
	public int getRs_price() {
		return rs_price;
	}
	public void setRs_price(int rs_price) {
		this.rs_price = rs_price;
	}
	public String getU_tell() {
		return u_tell;
	}
	public void setU_tell(String u_tell) {
		this.u_tell = u_tell;
	}
	
	@Override
	public String toString() {
		return "RoomReservation [rs_number=" + rs_number + ", u_number=" + u_number + ", r_number=" + r_number
				+ ", rs_date=" + rs_date + ", rs_time1=" + rs_time1 + ", rs_time2=" + rs_time2 + ", rs_time3="
				+ rs_time3 + ", rs_time4=" + rs_time4 + ", rs_time5=" + rs_time5 + ", rs_time6=" + rs_time6
				+ ", u_name=" + u_name + ", r_price=" + r_price + ", rs_price=" + rs_price + ", u_tell=" + u_tell + "]";
	}
	

	
	
	
	
}
