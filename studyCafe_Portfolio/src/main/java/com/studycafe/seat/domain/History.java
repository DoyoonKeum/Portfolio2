package com.studycafe.seat.domain;

import java.util.Date;

public class History {
	//필드
	private int h_number;
	private int u_number;
	private int h_grade;
	private String h_userId;
	private Date h_time;
	private int h_wallet;
	private int h_isUsing;
	
	
	public History() {
		
	}
	
	
	
	public History(int h_number, int u_number, int h_grade, String h_userId, Date h_time, int h_wallet, int h_isUsing) {
		this.h_number = h_number;
		this.u_number = u_number;
		this.h_grade = h_grade;
		this.h_userId = h_userId;
		this.h_time = h_time;
		this.h_wallet = h_wallet;
		this.h_isUsing = h_isUsing;
	}
	public int getH_number() {
		return h_number;
	}
	public void setH_number(int h_number) {
		this.h_number = h_number;
	}
	public int getU_number() {
		return u_number;
	}
	public void setU_number(int u_number) {
		this.u_number = u_number;
	}
	public int getH_grade() {
		return h_grade;
	}
	public void setH_grade(int h_grade) {
		this.h_grade = h_grade;
	}
	public String getH_userId() {
		return h_userId;
	}
	public void setH_userId(String h_userId) {
		this.h_userId = h_userId;
	}
	public Date getH_time() {
		return h_time;
	}
	public void setH_time(Date h_time) {
		this.h_time = h_time;
	}
	public int getH_wallet() {
		return h_wallet;
	}
	public void setH_wallet(int h_wallet) {
		this.h_wallet = h_wallet;
	}
	public int getH_isUsing() {
		return h_isUsing;
	}
	public void setH_isUsing(int h_isUsing) {
		this.h_isUsing = h_isUsing;
	}



	@Override
	public String toString() {
		return "History h_number=" + h_number + ", u_number=" + u_number + ", h_grade=" + h_grade + ", h_userId="
				+ h_userId + ", h_time=" + h_time + ", h_wallet=" + h_wallet + ", h_isUsing=" + h_isUsing;
	}
	

}
