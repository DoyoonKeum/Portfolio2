package com.studycafe.qna.domain;

import java.util.Date;

public class QnaComment {

	private int qr_no;
	private int qr_orino;
	private String qr_writer;
	private String qr_title;
	private String qr_content;
	private Date qr_regdate;
	private String qr_isshow;
	private int qr_good;
	private int qr_bad;
	
	
	public QnaComment() {}
	public QnaComment(int qr_no, int qr_orino, String qr_writer, String qr_title, String qr_content, Date qr_regdate,
			String qr_isshow, int qr_good, int qr_bad) {
		super();
		this.qr_no = qr_no;
		this.qr_orino = qr_orino;
		this.qr_writer = qr_writer;
		this.qr_title = qr_title;
		this.qr_content = qr_content;
		this.qr_regdate = qr_regdate;
		this.qr_isshow = qr_isshow;
		this.qr_good = qr_good;
		this.qr_bad = qr_bad;
	}
	
	
	
	public int getQr_no() {
		return qr_no;
	}
	public void setQr_no(int qr_no) {
		this.qr_no = qr_no;
	}
	public int getQr_orino() {
		return qr_orino;
	}
	public void setQr_orino(int qr_orino) {
		this.qr_orino = qr_orino;
	}
	public String getQr_writer() {
		return qr_writer;
	}
	public void setQr_writer(String qr_writer) {
		this.qr_writer = qr_writer;
	}
	public String getQr_title() {
		return qr_title;
	}
	public void setQr_title(String qr_title) {
		this.qr_title = qr_title;
	}
	public String getQr_content() {
		return qr_content;
	}
	public void setQr_content(String qr_content) {
		this.qr_content = qr_content;
	}
	public Date getQr_regdate() {
		return qr_regdate;
	}
	public void setQr_regdate(Date qr_regdate) {
		this.qr_regdate = qr_regdate;
	}
	public String getQr_isshow() {
		return qr_isshow;
	}
	public void setQr_isshow(String qr_isshow) {
		this.qr_isshow = qr_isshow;
	}
	public int getQr_good() {
		return qr_good;
	}
	public void setQr_good(int qr_good) {
		this.qr_good = qr_good;
	}
	public int getQr_bad() {
		return qr_bad;
	}
	public void setQr_bad(int qr_bad) {
		this.qr_bad = qr_bad;
	}
	
	
	
	@Override
	public String toString() {
		return "QnaComment [qr_no=" + qr_no + ", qr_orino=" + qr_orino + ", qr_writer=" + qr_writer + ", qr_title="
				+ qr_title + ", qr_content=" + qr_content + ", qr_regdate=" + qr_regdate + ", qr_isshow=" + qr_isshow
				+ ", qr_good=" + qr_good + ", qr_bad=" + qr_bad + "]";
	}

	
	
	
	
}
