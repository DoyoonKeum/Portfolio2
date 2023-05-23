package com.studycafe.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.qna.domain.Page;
import com.studycafe.qna.domain.Qna;
import com.studycafe.qna.domain.QnaComment;
import com.studycafe.qna.domain.QnaPage;
import com.studycafe.qna.domain.SearchPage;
import com.studycafe.qna.repository.QnaRepository;

@Service
public class QnaServiceImpl implements QnaService {

		@Autowired
		private QnaRepository qnaRepository;

		@Override
		public QnaPage getQnaPage(Page page) {
			int total = qnaRepository.selectCount();//전체 게시물수 
			//int calNo=(pageNo-1)*size;
			List<Qna> qnaList = qnaRepository.select(page); 
			return new QnaPage(total, page.getPageNo(), page.getRowSize(), qnaList);
		}
			
		@Override
		public QnaPage getQnaPage(SearchPage sPage) { //리턴 유형이 바뀜
			int sTotal = qnaRepository.searchSelectCount(sPage);//q_title전체 게시물수 
			//int calNo=(pageNo-1)*size;
			System.out.println("sPage : "+sPage);
			List<Qna> sQnaList = qnaRepository.searchSelect(sPage); 
			System.out.println("sQnaList결과값은 무엇인가요"+sQnaList);
			return new QnaPage(sTotal, sPage.getPageNo(), sPage.getRowSize(), sQnaList);
		}


		
		@Override
		public Qna getQnaDetail(int no, boolean increaseReadCount) {
			
			Qna qna = qnaRepository.selectById(no);
			if(qna==null) { //qna테이블에서 특정글번호에 해당하는 레코드 존재X
				throw new QnaNotFoundException();
			}
			//특정글번호 상세조회시 조회수 증가
			if(increaseReadCount) {
				qnaRepository.increaseReadCount(no);
			}
			return qna;
		}
		
		@Override
		public void addQnaWrite(Qna qna) {
			qnaRepository.addQnaWrite(qna);
		}

		@Override
		public void qnaWriteWithPw(Qna qna) throws Exception {
			qnaRepository.qnaWriteWithPw(qna);			
		}
			
		@Override
		public void modifyQna(Qna qna) throws Exception {
			qnaRepository.modifyQna(qna);
		}

		@Override
		public void deleteQna(int no) throws Exception {
			qnaRepository.deleteQna(no);
		}

		@Override
		public void writeReply(QnaComment qnaComm) throws Exception {
			qnaRepository.writeReply(qnaComm);
			
		}

		@Override
		public List<QnaComment> selectReply(int orino) throws Exception {
			List<QnaComment> qnaComm = qnaRepository.selectReply(orino);
			return qnaComm;
		}

		@Override
		public void modifyReply(QnaComment qnaComm) throws Exception {
			qnaRepository.modifyReply(qnaComm);
			
		}
		
		@Override
		public void DeleteReply(int qr_no) throws Exception{
			qnaRepository.DeleteReply(qr_no);
		}
		
		@Override
		public void updateQnaStatus(Qna qna) throws Exception{
			qnaRepository.updateQnaStatus(qna);
		}

		@Override
		public void qnaModifyWithPw(Qna qna) throws Exception {
			qnaRepository.qnaModifyWithPw(qna);			
			
		}

			
}









