package com.studycafe.article.domain;

import java.util.Date;

public class Article {

	
	private int a_no;
	private String a_title;
	private String a_content;
	private Date a_regdate;
	private Date a_modidate;
	private int a_cnt;
	private String a_isshow;
	private int u_number;
	private String u_id;
	
	public Article() {}
	


	public Article(int a_no, String a_title, String a_content, Date a_regdate, Date a_modidate, int a_cnt,
			String a_isshow, int u_number, String u_id) {
		this.a_no = a_no;
		this.a_title = a_title;
		this.a_content = a_content;
		this.a_regdate = a_regdate;
		this.a_modidate = a_modidate;
		this.a_cnt = a_cnt;
		this.a_isshow = a_isshow;
		this.u_number = u_number;
		this.u_id = u_id;
	}






	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getA_title() {
		return a_title;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public Date getA_regdate() {
		return a_regdate;
	}
	public void setA_regdate(Date a_regdate) {
		this.a_regdate = a_regdate;
	}
	public Date getA_modidate() {
		return a_modidate;
	}
	public void setA_modidate(Date a_modidate) {
		this.a_modidate = a_modidate;
	}
	public int getA_cnt() {
		return a_cnt;
	}
	public void setA_cnt(int a_cnt) {
		this.a_cnt = a_cnt;
	}
	public String getA_isshow() {
		return a_isshow;
	}
	public void setA_isshow(String a_isshow) {
		this.a_isshow = a_isshow;
	}
	public int getU_number() {
		return u_number;
	}
	public void setU_number(int u_number) {
		this.u_number = u_number;
	}

	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}



	@Override
	public String toString() {
		return "Article [a_no=" + a_no + ", a_title=" + a_title + ", a_content=" + a_content + ", a_regdate="
				+ a_regdate + ", a_modidate=" + a_modidate + ", a_cnt=" + a_cnt + ", a_isshow=" + a_isshow
				+ ", u_number=" + u_number + ", u_id=" + u_id + "]";
	}
	
	
	
	
	
}
