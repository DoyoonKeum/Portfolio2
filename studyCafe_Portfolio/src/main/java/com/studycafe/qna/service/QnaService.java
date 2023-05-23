package com.studycafe.qna.service;

import java.util.List;

import com.studycafe.qna.domain.Page;
import com.studycafe.qna.domain.Qna;
import com.studycafe.qna.domain.QnaComment;
import com.studycafe.qna.domain.QnaPage;
import com.studycafe.qna.domain.SearchPage;


public interface QnaService {

	
	public QnaPage getQnaPage(Page page) throws Exception;
	
	public QnaPage getQnaPage(SearchPage sPage) throws Exception;

	public Qna getQnaDetail(int no, boolean increaseReadCount) throws Exception;
	
	public void addQnaWrite(Qna qna) throws Exception;

	public void modifyQna(Qna qna) throws Exception;

	public void deleteQna(int no) throws Exception;

	public void writeReply(QnaComment qnaComm) throws Exception;

	public List<QnaComment> selectReply(int orino) throws Exception;

	public void modifyReply(QnaComment qnaComm) throws Exception;

	public void DeleteReply(int qr_no) throws Exception;

	public void updateQnaStatus(Qna qna) throws Exception;

	public void qnaWriteWithPw(Qna qna) throws Exception;
	
	public void qnaModifyWithPw(Qna qna) throws Exception;
	
	
}
