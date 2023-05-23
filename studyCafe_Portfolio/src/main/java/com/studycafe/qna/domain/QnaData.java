package com.studycafe.qna.domain;



//p657
//DB의 notice테이블과 notice_content테이블 관련 데이터를 저장, 제공하는 클래스
public class QnaData {
	//필드
	private Qna qna;
	//private NoticeContent content;
	
	
	//생성자
	public QnaData(Qna qna) {
	//public QnaData(Qna qna, NoticeContent content) {
		this.qna = qna;
		//this.content = content;
	}


	//메소드
	public Qna getNotice() {
		return qna;
	}

//	public NoticeContent getContent() {
//		return content;
//	}

//	@Override
//	public String toString() {
//		return "NoticeData [notice=" + notice + ", content=" + content + "]";
//	}
	
	
	
	
	
	
	

}
