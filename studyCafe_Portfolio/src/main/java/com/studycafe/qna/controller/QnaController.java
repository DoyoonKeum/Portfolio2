package com.studycafe.qna.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.studycafe.qna.domain.Page;
import com.studycafe.qna.domain.Qna;
import com.studycafe.qna.domain.QnaComment;
import com.studycafe.qna.domain.QnaPage;
import com.studycafe.qna.domain.SearchPage;
import com.studycafe.qna.domain.User;
import com.studycafe.qna.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	QnaService qnaService;

	//qna 게시글 전체 조회(검색기능 포함)
	@RequestMapping(value="/qna/list", method= {RequestMethod.GET, RequestMethod.POST})
	public String qnaList(Model model,HttpServletRequest request) throws Exception {
		
		
//		insert into user_info(u_number, u_name, u_id, u_pass, u_grade, u_tell, u_gender)
//		values(1, '관리자', 'adminid', '1234', 5, '01042485278', '남' );
//		insert into user_info(u_number, u_name, u_id, u_pass, u_grade, u_tell, u_gender)
//		values(2, '홍길동', 'hongid', '1234', 1, '01088521142', '남' );
//		User authUser = new User(1, "관리자", "adminid", "1234", 999, "01044859948", "남" );
//		User authUser = new User(2, "은하수", "eunid", "1234", 1, "01044859948", "남" );
//		User authUser = new User(2, "홍길동", "hongid", "1234", 1, "01088521142", "남" );
//		request.getSession().setAttribute("AUTHUSER", authUser); //원래 여기에 없는 코드. 추후 취합 시에 삭제 필요
		
		
		//1.파라미터 얻기(향후 보고싶은 페이지)
		String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}

		String strRowSize = request.getParameter("rowSize");//한페이지당 보여지는 게시물 수
		int rowSize = 5;
		if(strRowSize!=null) {
			rowSize = Integer.parseInt(strRowSize);			
		}

		//?choice=title&keyword=~~
		String strChoice = request.getParameter("choice");//view페이지 내에 select 태그 id
		String choice = "";
		if(strChoice!=null) {
			choice=strChoice;
		}
		String strKeyword = request.getParameter("keyword");//유저 검색 키워드
		String keyword = "";
		if(strKeyword!=null) {
			keyword=strKeyword;
		}
		
		System.out.println("초이스는"+choice);
		System.out.println("검색어는는"+keyword);
		
		//2.비즈니스 로직 수행 -> Service -> DAO -> DB -> DAO -> Service -> 비즈니스 로직 수행(되돌아 온다)
		QnaPage qnaPage = null;
		if(keyword==null || keyword=="") {
			//qnaPage = qnaService.getQnaPage(pageNo, rowSize);	//원래소스
			Page page = new Page(pageNo, rowSize);
			qnaPage = qnaService.getQnaPage(page);	//원래소스
		}else {
			SearchPage sPage = new SearchPage(keyword, choice, pageNo, rowSize);
			qnaPage = qnaService.getQnaPage(sPage);
		}
		//List<QnaFile> qnaFile = qnaService.listFile();

		
		System.out.println("sqnaPage특성!!!!"+qnaPage.getTotal());
		
//		model.addAttribute("AUTHUSER", authUser);
		model.addAttribute("qnaPage", qnaPage);
		//model.addAttribute("qnaFile", qnaFile);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("rowSize", rowSize);
		model.addAttribute("choice", choice);
		model.addAttribute("keyword", keyword);
		//System.out.println("List 결과"+qnaFile);
		
		//4.View지정
		return "qna/listQna";
	}


	//qna 게시글 상세 보기(조회)+답글 목록 조회
	//private NoticeFile noticeFile = null;
	@RequestMapping(value="/qna/read", method= {RequestMethod.GET, RequestMethod.POST})
	public String qnaRead(Model model, HttpServletRequest request,int no) throws Exception {
		System.out.println("ReadNoticeHandler의 Process()호출성공");
		
		//컨트롤러가 해야 할 일
		//1.파라미터 얻기
		//no=상세조회할 글번호 &pageNo=요청페이지&rowSize=1페이지당 게시글수
//		String strNo = request.getParameter("no");
//		int no = 1;
//		if(strNo!=null) {
//			no = Integer.parseInt(strNo);//상세조회할 글번호
//		}
		
		
		
		//만약 파라미터 pageNo(즉, 요청페이지)가 null이면 요청페이지를 1로 설정
		String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}		
		
		//만약 파라미터 rowSize(페이지당 게시글수)가 null이면 페이지당 게시글수를 3으로 설정
		String strRowSize = request.getParameter("rowSize");//한페이지당 보여지는 게시물 수
		int rowSize = 5;
		if(strRowSize!=null) {
			rowSize = Integer.parseInt(strRowSize);			
		}
			
		//2.비즈니스 로직 수행 -> Service -> DAO -> DB -> DAO -> Service -> 비즈니스 로직 수행(되돌아 온다)
		/*파라미터
		 int no : 상세조회할 글번호
		 boolean increaseReadCount:ture(이면 조회수 증가)*/
	     System.out.println("@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@"+no);
	     //System.out.println("@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@"+q_no);
		
		 Qna qna =  qnaService.getQnaDetail(no, true);
		

		 List<QnaComment> qnaComm = qnaService.selectReply(no);
		System.out.println("qnaComm@@@@@@@@@@@@@@@@"+qnaComm);
		
		 //3.Model(비즈니스로직 수행결과)처리
		 //릴레이용 pageNo=요청페이지&rowSize=1페이지당 게시글수
		 model.addAttribute("qna", qna);
		 model.addAttribute("qnaComm",qnaComm);
		 model.addAttribute("pageNo", pageNo);
		 model.addAttribute("rowSize", rowSize);

		 //4.View지정
		 return "qna/readQna";
	 }

	//qna글쓰기 폼 보여주기
	@RequestMapping(value="/qna/writeForm", method=RequestMethod.GET)
	public String qnaWriteForm(HttpServletRequest request, Model model) throws Exception {
		
		String strRsize=request.getParameter("rowSize"); //1페이지당 보여줄 페이지수
		int rowSize=3;
		if(strRsize!=null) {
			rowSize = Integer.parseInt(strRsize);			
		}
		
		String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}
		model.addAttribute("rowSize", rowSize); //로우사이즈 기본3
		model.addAttribute("pageNo", pageNo); //
			return "qna/writeForm";
	}

	//qna글쓰기 처리
	@RequestMapping(value="/qna/write", method=RequestMethod.POST)
	public String qnaWrite(HttpServletRequest request, Model model, Qna qna) throws Exception {
		
		String strRowSize = request.getParameter("rowSize");
		int rowSize = 5;
		if(strRowSize!=null) {
			rowSize = Integer.parseInt(strRowSize);			
		}
		String strPageNo = request.getParameter("pageNo");
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}

		if(qna.getQ_isopen()!=null) {
			qnaService.qnaWriteWithPw(qna);
		}else {
			qnaService.addQnaWrite(qna);
		}
		

		//model.addAttribute("newNoticeNo", newNoticeNo); 
		model.addAttribute("rowSize", rowSize);
		model.addAttribute("pageNo", pageNo);

		return "redirect:/qna/list";

	}//qnaWrite()끝


	@RequestMapping(value="/qna/modifyForm", method=RequestMethod.GET)
	public String qnaModifyForm(HttpServletRequest request, Model model, @RequestParam("no") int no, Qna qna) throws Exception{
		
		String strRowSize = request.getParameter("rowSize");
		int rowSize = 5;
		if(strRowSize!=null) {
			rowSize = Integer.parseInt(strRowSize);			
		}
		
		String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}
		
		qna = qnaService.getQnaDetail(no, false);
		model.addAttribute("qna",qna);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("rowSize",rowSize);
		return "qna/modifyForm";
	}
	
	
	@RequestMapping(value="/qna/modify", method=RequestMethod.POST)
	public String qnaModify(HttpServletRequest request, Model model, @RequestParam("q_no") int q_no, Qna qna) throws Exception {
		
		String strRowSize = request.getParameter("rowSize");
		int rowSize = 5;
		if(strRowSize!=null) {
			rowSize = Integer.parseInt(strRowSize);			
		}
		String strPageNo = request.getParameter("pageNo");
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}
					
		if(qna.getQ_isopen()!=null) {
			qnaService.qnaModifyWithPw(qna);
		}else {
			qnaService.modifyQna(qna);
		}
				
		System.out.println("qna!!!!!!!!!!!"+qna);
		
		//model.addAttribute("newNoticeNo",newNoticeNo);
		model.addAttribute("qna",qna);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("rowSize",rowSize);
		
		qnaService.modifyQna(qna);
		return "redirect:/qna/read?no="+q_no;
	}
	
	
	
	@RequestMapping(value="/qna/delete", method=RequestMethod.GET)
	public String qnaDelete(HttpServletRequest request, Model model, 
							@RequestParam("no") int no) throws Exception {
		
		qnaService.deleteQna(no);
		return "redirect:/qna/list";
	}
	
	
	
	
	
	@RequestMapping(value="/qna/writeReply", method=RequestMethod.POST)
	public String qnaWriteReply(Model model, @RequestParam("oriNo") int orino,
								HttpServletRequest request, QnaComment qnaComm) throws Exception{
		String strRowSize = request.getParameter("rowSize");
		int rowSize = 5;
		if(strRowSize!=null) {
			rowSize = Integer.parseInt(strRowSize);			
		}
		
		String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}
		qnaComm.setQr_orino(orino);
		qnaService.writeReply(qnaComm);
		
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("rowSize",rowSize);	
		return "redirect:/qna/read?no="+orino;
		//return "redirect:/qna/selectReply";
		//return "/qna/selectReply";
	}
	

	@RequestMapping(value="/qna/modifyReply", method=RequestMethod.POST)
	public String qnaSelectReply(Model model, HttpServletRequest request, QnaComment qnaComm,@RequestParam("qr_orino") int orino, int qr_no) throws Exception {
		
		String strRowSize = request.getParameter("rowSize");
		int rowSize = 5;
		if(strRowSize!=null) {
			rowSize = Integer.parseInt(strRowSize);			
		}
		
		String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}
		
//		String strOrino = request.getParameter("oriNo");
//		int orino = Integer.parseInt(strOrino);
		
//		int orino = qnaComm.getQr_orino();
		
		System.out.println("orino******************************"+orino);
		System.out.println("@#@#@#"+qnaComm);
	
		
		qnaService.modifyReply(qnaComm);
		
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("rowSize",rowSize);	
		
		//return "redirect:/qna/read?no="+orino;
		return "redirect:/qna/read?no="+orino;
	}
	
	
	@RequestMapping(value="/qna/deleteReply", method=RequestMethod.GET)
	public String qnaDeleteReply(Model model, HttpServletRequest request, @RequestParam("qr_orino") int orino, int qr_no) throws Exception {
		String strRowSize = request.getParameter("rowSize");
		int rowSize = 5;
		if(strRowSize!=null) {
			rowSize = Integer.parseInt(strRowSize);			
		}
		
		String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}
		qnaService.DeleteReply(qr_no);
		
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("rowSize",rowSize);	
		
		
		return "redirect:/qna/read?no="+orino;
	}
	
	@RequestMapping(value="/qna/qnaStatus", method=RequestMethod.POST)
	public String qnaReplyStatus(Model model, HttpServletRequest request,Qna qna, int q_no) throws Exception {
		
		qnaService.updateQnaStatus(qna);
		
		return "redirect:/qna/read?no="+q_no;
	}
	
	
	@RequestMapping(value="/qna/getReadwithpw", method= {RequestMethod.GET, RequestMethod.POST})
	public String getReadwithpw(Model model, HttpServletRequest request,int no) throws Exception {
		
		String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}

		String strRowSize = request.getParameter("rowSize");//한페이지당 보여지는 게시물 수
		int rowSize = 5;
		if(strRowSize!=null) {
			rowSize = Integer.parseInt(strRowSize);			
		}
		
		System.out.println("ReadNoticeHandler의 Process()호출성공");
		
	     System.out.println("@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@"+no);
	     

		 Qna qna =  qnaService.getQnaDetail(no, true);
		
	     System.out.println("@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@"+qna);

				
		 //3.Model(비즈니스로직 수행결과)처리
		 //릴레이용 pageNo=요청페이지&rowSize=1페이지당 게시글수
		 model.addAttribute("qna", qna);
	     model.addAttribute("pageNo",pageNo);
		 model.addAttribute("rowSize",rowSize);	
	
		 //4.View지정
		 return "qna/checkpw";
	 }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
