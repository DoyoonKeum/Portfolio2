package com.studycafe.seat.domain;

public class Seat {
	private int s_number;
	private int s_isusing;
	private String s_historyno;
	
	//기본 생성자
	public Seat() {
		
	}
	
	//전체 생성자
	public Seat(int s_number, int s_isusing, String s_historyno) {
		this.s_number = s_number;
		this.s_isusing = s_isusing;
		this.s_historyno = s_historyno;
	}

	public int getS_number() {
		return s_number;
	}

	public void setS_number(int s_number) {
		this.s_number = s_number;
	}

	public int getS_isusing() {
		return s_isusing;
	}

	public void setS_isusing(int s_isusing) {
		this.s_isusing = s_isusing;
	}

	public String getS_historyno() {
		return s_historyno;
	}

	public void setS_historyno(String s_historyno) {
		this.s_historyno = s_historyno;
	}

	@Override
	public String toString() {
		return "Seat s_number=" + s_number + ", s_usable=" + s_isusing + ", s_historyno=" + s_historyno;
	}
	
	
	
	
	
	
}
