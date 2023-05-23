package com.studycafe.article.domain;

import java.util.Date;

public class ArticleComment {

	private int ac_no;
	private int a_no;
	private String ac_content;
	private Date ac_regdate;
	private Date ac_modidate;
	private String ac_isshow;
	private int u_number;
	private String u_id;
	
	public ArticleComment() {}

	public ArticleComment(int ac_no, int a_no, String ac_content, Date ac_regdate, Date ac_modidate, String ac_isshow,
			int u_number, String u_id) {
		super();
		this.ac_no = ac_no;
		this.a_no = a_no;
		this.ac_content = ac_content;
		this.ac_regdate = ac_regdate;
		this.ac_modidate = ac_modidate;
		this.ac_isshow = ac_isshow;
		this.u_number = u_number;
		this.u_id = u_id;
	}

	public int getAc_no() {
		return ac_no;
	}

	public void setAc_no(int ac_no) {
		this.ac_no = ac_no;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public String getAc_content() {
		return ac_content;
	}

	public void setAc_content(String ac_content) {
		this.ac_content = ac_content;
	}

	public Date getAc_regdate() {
		return ac_regdate;
	}

	public void setAc_regdate(Date ac_regdate) {
		this.ac_regdate = ac_regdate;
	}

	public Date getAc_modidate() {
		return ac_modidate;
	}

	public void setAc_modidate(Date ac_modidate) {
		this.ac_modidate = ac_modidate;
	}

	public String getAc_isshow() {
		return ac_isshow;
	}

	public void setAc_isshow(String ac_isshow) {
		this.ac_isshow = ac_isshow;
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
		return "ArticleComment [ac_no=" + ac_no + ", a_no=" + a_no + ", ac_content=" + ac_content + ", ac_regdate="
				+ ac_regdate + ", ac_modidate=" + ac_modidate + ", ac_isshow=" + ac_isshow + ", u_number=" + u_number
				+ ", u_id=" + u_id + "]";
	}


	
}
