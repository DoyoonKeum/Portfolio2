package com.studycafe.qna.domain;

import java.util.Date;

//p631
//notice테이블(의 작성자 id, 작성자명)에 해당하는 데이터를 관리하는 클래스
public class Qna {
	private int q_no;
	private String q_writer; 
	private String q_title;
	private String q_content;
	private Date q_regdate;//최초작성일    regdate
	private Date q_moddate;//마지막수정일 moddate
	private int q_cnt; //조회수 read_cnt
	private String q_isopen; //조회수 read_cnt
	private String q_openpw; //조회수 read_cnt
	private String q_isshow;//노출(삭제)여부.기본Y. Y(노출),N(미노출,삭제된 데이터)
	private int q_chk;//노출(삭제)여부.기본Y. Y(노출),N(미노출,삭제된 데이터)
	private int u_number;
	
	public Qna() {}
	public Qna(int q_no, String q_writer, String q_title, String q_content, Date q_regdate, Date q_moddate, int q_cnt,
			String q_isopen, String q_openpw, String q_isshow, int q_chk, int u_number) {
		super();
		this.q_no = q_no;
		this.q_writer = q_writer;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_regdate = q_regdate;
		this.q_moddate = q_moddate;
		this.q_cnt = q_cnt;
		this.q_isopen = q_isopen;
		this.q_openpw = q_openpw;
		this.q_isshow = q_isshow;
		this.q_chk = q_chk;
		this.u_number = u_number;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_writer() {
		return q_writer;
	}
	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Date getQ_regdate() {
		return q_regdate;
	}
	public void setQ_regdate(Date q_regdate) {
		this.q_regdate = q_regdate;
	}
	public Date getQ_moddate() {
		return q_moddate;
	}
	public void setQ_moddate(Date q_moddate) {
		this.q_moddate = q_moddate;
	}
	public int getQ_cnt() {
		return q_cnt;
	}
	public void setQ_cnt(int q_cnt) {
		this.q_cnt = q_cnt;
	}
	public String getQ_isopen() {
		return q_isopen;
	}
	public void setQ_isopen(String q_isopen) {
		this.q_isopen = q_isopen;
	}
	public String getQ_openpw() {
		return q_openpw;
	}
	public void setQ_openpw(String q_openpw) {
		this.q_openpw = q_openpw;
	}
	public String getQ_isshow() {
		return q_isshow;
	}
	public void setQ_isshow(String q_isshow) {
		this.q_isshow = q_isshow;
	}
	public int getQ_chk() {
		return q_chk;
	}
	public void setQ_chk(int q_chk) {
		this.q_chk = q_chk;
	}
	public int getU_number() {
		return u_number;
	}
	public void setU_number(int u_number) {
		this.u_number = u_number;
	}
	@Override
	public String toString() {
		return "Qna [q_no=" + q_no + ", q_writer=" + q_writer + ", q_title=" + q_title + ", q_content=" + q_content
				+ ", q_regdate=" + q_regdate + ", q_moddate=" + q_moddate + ", q_cnt=" + q_cnt + ", q_isopen="
				+ q_isopen + ", q_openpw=" + q_openpw + ", q_isshow=" + q_isshow + ", q_chk=" + q_chk + ", u_number="
				+ u_number + "]";
	}
	
	

	
	

	
	
}
