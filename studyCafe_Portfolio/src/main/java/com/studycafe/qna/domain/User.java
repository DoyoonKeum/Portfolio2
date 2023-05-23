package com.studycafe.qna.domain;

//로그인한 user에 대한 정보

public class User {
	
	//필드
	private int u_number;				//회원번호
	private String u_name;		//한글이름
	private String u_id;			//아이디
	private String u_pass;			//비밀번호
	private int u_grade;			//1(일반) 2(관리자)
	private String u_tell;	//핸드폰번호
	private String u_gender;		//이메일
	
	public User() {}
	public User(int u_number, String u_name, String u_id, String u_pass, int u_grade, String u_tell, String u_gender) {
		this.u_number = u_number;
		this.u_name = u_name;
		this.u_id = u_id;
		this.u_pass = u_pass;
		this.u_grade = u_grade;
		this.u_tell = u_tell;
		this.u_gender = u_gender;
	}
	public int getU_number() {
		return u_number;
	}
	public void setU_number(int u_number) {
		this.u_number = u_number;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pass() {
		return u_pass;
	}
	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}
	public int getU_grade() {
		return u_grade;
	}
	public void setU_grade(int u_grade) {
		this.u_grade = u_grade;
	}
	public String getU_tell() {
		return u_tell;
	}
	public void setU_tell(String u_tell) {
		this.u_tell = u_tell;
	}
	public String getU_gender() {
		return u_gender;
	}
	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}
	@Override
	public String toString() {
		return "User [u_number=" + u_number + ", u_name=" + u_name + ", u_id=" + u_id + ", u_pass=" + u_pass
				+ ", u_grade=" + u_grade + ", u_tell=" + u_tell + ", u_gender=" + u_gender + "]";
	}
	
	
	
	
	

	

	
	
	
}

