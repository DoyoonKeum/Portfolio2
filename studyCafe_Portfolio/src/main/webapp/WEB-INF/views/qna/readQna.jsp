<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>

 <title>QnaReadDetail</title>
 <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

    
    
    <script src="<%=request.getContextPath()%>/assets/js/jquery-2.1.0.min.js"></script>

    
    <!-- Global Init -->
       <style>
		#main1 {
	    width: 800px;
	    height: 600px;
	    margin-left: auto;
	    margin-right: auto;
	 	}
	 	th {
	    text-align: center;
/* 	    border: 1px solid #EFEFEF; */
	    background: #BACEC1;
	    width : 190px;
	 	}
	 	#rep1 {
	 	
	 	width: 780px;
	 	margin-left: auto;
	    margin-right: auto;
	    }
	 	#rep2 {
	 	
	 	width: 780px;
	 	margin-left: auto;
	    margin-right: auto;
	    }
	    #rep3 {
	 	
	 	width: 780px;
	 	margin-left: auto;
	    margin-right: auto;
	    }
	    
	 	
	 	.c {
	    text-align: left;
/* 	    border: 1px solid #EFEFEF; */
/* 	    background: #C5CAD7 */
		padding-left : 5px; 
	 	}
	 	
	 	
	 	#list{
/* 	 	  color: white; */
		  text-align: center;
/* 		  background: #7C8EBF; */
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	#mod{
/* 	 	  color: white; */
		  text-align: center;
/* 		  background: #7C8EBF; */
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	#del{
/* 	 	  color: white; */
		  text-align: center;
/* 		  background: #7C8EBF; */
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
        </style>
    
    
    

        <script>
        	$(document).ready(function(){
   		
        		
        		
        	 	$(".btnReplyU").click(function(){
        	 		let rNoVal=$(this).attr("param");//댓글번호
        	 		//alert("댓글번호"+rNoVal);

        	 		$("#frmModiReply"+rNoVal).show();
        	 		//$("#frmModiReply"+rNoVal).toggle();
        	 	});
        	 	
        	 	
        	 	$(".btnModiC").click(function(){
        	 		let rNoVal=$(this).attr("param");//댓글번호
        	 		//alert("댓글번호"+rNoVal);

        	 		$("#frmModiReply"+rNoVal).hide();
        	 		//$("#frmModiReply"+rNoVal).toggle();
        	 	});
    
        		
        	});
        	
        	function mdAuthCheck(gr){
        		//gr=999;
        		if(gr=null || gr=='1'){
        			alert("권한이 없습니다.");
        			location.href='<%=request.getContextPath()%>/qna/read?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}else{
        			location.href='<%=request.getContextPath()%>/qna/modify?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}
        	}
        	
        	
        	function rmAuthCheck(gr){
        		//gr=999;
        		if(gr=null || gr=='1'){
        			alert("권한이 없습니다.");
        			location.href='<%=request.getContextPath()%>/qna/read?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}else{
        			location.href='<%=request.getContextPath()%>/qna/delete?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}
        	}
        	
        	
        	function rmAuthCheck2(gr){
        		//gr=999;
        		if(gr=null || gr=='1'){
        			alert("권한이 없습니다.");
        			location.href='<%=request.getContextPath()%>/qna/read?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}else{
        			location.href='<%=request.getContextPath()%>/qna/delete2?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}
        	}
        	
        	
        	
        	function deleteConfirm(){
       		 if (confirm("삭제를 진행하시겠습니까?")) {
       	            alert("삭제가 완료되었습니다.");
       				location.href='<%=request.getContextPath()%>/qna/delete?no=${qna.q_no}';
       	        } else {
       	            alert("삭제가 취소되었습니다.");
       	        	location.href='<%=request.getContextPath()%>/qna/read?no=${qna.q_no}&pageNo=${pageNo}&rowSize=${rowSize}';

       	        }
       		}
        	
        	
        	
        	function deleteReplyConfirm(){
         		 if (confirm("답글 삭제를 진행하시겠습니까?")) {
         	            alert("답글 삭제가 완료되었습니다.");
         	           $("#frmDelReply").submit();
<%--          				location.href='<%=request.getContextPath()%>/qna/deleteReply?qr_no=&qr_orino=q_no'; --%>
         	        } else {
         	            alert("답글 삭제가 취소되었습니다.");
         	        	location.href='<%=request.getContextPath()%>/qna/read?no=${qna.q_no}&pageNo=${pageNo}&rowSize=${rowSize}';

         	        }
          	}
        	

     
        	

        </script>
        

</head>
<body>

<%-- 컨트롤러에 의해 아래와 같이 Model 받았다.
		request.setAttribute("qna", qna);//notice테이블과 notice_content테이블
		request.setAttribute("pageNo", pageNo);//요청페이지
		request.setAttribute("rowSize", rowSize);//1페이지당 게시글수
*내용:${noticeData}<br/><br/>
*요청페이지:${pageNo}<br/><br/>
*1페이지당 게시글수:${rowSize}<br/><br/>--%>


<!-- <p class="home" style="margin:0 auto; max-width: 950px;"> -->
<%-- <a href="<%=request.getContextPath()%>/qna/list">HOME</a> --%>
<!-- </p> -->
 	<c:if test="${AUTHUSER.u_grade==999}">
	 	<form name="qnaChkFrm" id="qnaChkFrm" action="<%=request.getContextPath()%>/qna/qnaStatus" method="post">
	 	 <input type="hidden" name="q_no" id="q_no" value="${qna.q_no}"/>
	 	
		 	<table border="1" style="text-align:right; height:60px; margin:0 auto;">
			 	<tr>
			 		<th>답변 진행상태</th>
						<td>
							<select name = "q_chk" id = "q_chk" >
								<option value="" disabled>선택</option>
								<option value="1" <c:if test="${qna.q_chk == 1}">selected</c:if>>미답변</option>
					         	<option value="2" <c:if test="${qna.q_chk == 2}">selected</c:if>>답변 준비중</option>
					         	<option value="3" <c:if test="${qna.q_chk == 3}">selected</c:if>>답변 완료</option>
					    	</select> 
						<input type="submit" id="statBtn" value="상태저장"></button>
						</td>
			 	</tr>
		 	</table>
		 	
		</form>
 	</c:if>



<br/><br/>
 <table id="main1" border="1" style="text-align:center;">
<!--  <table border="1"> -->
 	<tr style="height:50px;">
 		<th class="h">게시글 번호</th>
 		<td class="c">${qna.q_no}</td>
 	</tr>
 	
 	 <tr style="height:50px;">
 		<th class="h">작성자</th>
 		<td class="c">${qna.q_writer}</td>
 	</tr>
 	
 	 <tr style="height:50px;">
 		<th class="h">최초 작성일</th>
 		<td class="c"><fmt:formatDate pattern="yyyy년 MM월 dd일  HH:mm:ss" type="date" value="${qna.q_regdate}" /></td>
 	</tr>
 	
 	<tr style="height:50px;">
 		<th class="h">마지막 수정일</th>
 		<td class="c"><fmt:formatDate pattern="yyyy년 MM월 dd일  HH:mm:ss" type="date" value="${qna.q_moddate}" /></td>
 	</tr>
 	
 	
 	 <tr style="height:50px;">
 		<th class="h">제목</th>
 		<td class="c">${qna.q_title}</td>
 	</tr>
 	
 	 <tr>
 		<th class="h">내용</th>
 		<td class="c" style="white-space: pre-wrap;"><u:pre value="${qna.q_content}"/>
 		<br/>
 		<br/>
 		<br/>
 		<br/>
 		<br/>
 		<br/>
 		<br/></td>
 	</tr>
 

 	 <tr style="height:50px;">
 		<td colspan="2" style="text-align:center;" class="c">
 		<%--pp662 29라인 
 		<c:set var="변수명" value="변수값"/> 
 		<%--
 		<c:set var="pageNo" value="${조건?조건참일경우:거짓일경우}"/>
 		
 		result="조건?"1":"100"
 		String result=null;
 		if(조건){
 			조건참일경우
 			result="1";
 		}else{
 			거짓일경우
 			result="100";
 		}
 		syso(result);--%>
 		
 		<c:set var="pageNo" value="${(empty param.pageNo)?'1':param.pageNo}"/>
 		<!--파라미터 pageNo값이 비어있으면 1로 세팅하고 그것이 아니면 (비어있지 않고 값이 있다면) 그 값으로 세팅해라~~
 		 * ListNoticeHandler에 이미 있지만 안정성을 위해서 한번 더 해준다.
		 * pageNo.isEmpty() = empty param.pageNO 와 같은 문법 -->
		 
		<%--pageNo=${pageNo}<br/> --%>

		<button type="button" id="list" onclick="location.href='<%=request.getContextPath()%>/qna/list?pageNo=1&rowSize=5'">처음 목록보기</button>
 		<button type="button" id="list" onclick="location.href='<%=request.getContextPath()%>/qna/list?pageNo=${pageNo}&rowSize=${rowSize}';">이전 목록보기</button>
 		<%--수정과 삭제기능은 로그인한 유저의 id와 작성자의 id가 일치하는 경우에만 노출하도록 한다. --%>
 		<c:if test="${AUTHUSER.u_id==qna.q_writer}">
 		<button type="button" id="mod" onclick="location.href='<%=request.getContextPath()%>/qna/modifyForm?no=${qna.q_no}&pageNo=${pageNo}&rowSize=${rowSize}';">게시글 수정</button>
 		</c:if>
 		<c:if test="${AUTHUSER.u_id==qna.q_writer || AUTHUSER.u_grade==999}">
		<button type="button" id="del" onclick="deleteConfirm()">게시글 삭제</button>
 		</c:if>
 		</td>
 	</tr>
 </table>
 <br/>
 <br/>
  <%-- c:if이용 댓글이 없는 경우 --%>
 <c:if test="${empty qnaComm}">
 <table class=t1" style="text-align:center; margin-left: auto; margin-right: auto;">
  <tbody>
   <tr>
	 <td colspan="4" class="center">
	     <Strong>등록된 답글이 없습니다.</Strong>
	 </td>
   </tr>
  </tbody>
 </table>
 </c:if>
 
 <%-- c:if이용 댓글이 있는 경우 c:forEach이용 반복출력 --%>
 <%-- 등록한 답글 목록 보기 --%>
  <c:if test="${not empty qnaComm}">
 	<c:forEach var="reply" items="${qnaComm}">		
 
 <form name = "frmDelReply" id="frmDelReply" 
 		action="<%=request.getContextPath()%>/qna/deleteReply" method="Get">	
 <input type="hidden" name="pageNo" id="pageNo${reply.qr_no}" value="${pageNo}"/>
 <input type="hidden" name="qr_orino" id="qr_orino${reply.qr_no}" value="${qna.q_no}"/>
 <input type="hidden" name="qr_no" id="qr_no${reply.qr_no}" value="${reply.qr_no}"/>
 	  <table border="1" id="rep2">
	 <tbody>
<!-- 		<tr style="height:50px;"> -->
<%-- 			 <th>답글 작성자</th><td>${reply.qr_writer}</td> --%>
<%-- 			 <th>답글 작성일</th><td>${reply.qr_regdate}</td> --%>
<!-- 		</tr> -->
			 
		<tr style="height:30px;">
			 <th>답글 제목</th> <td colspan="3">${reply.qr_title}</td>
			 <td rowspan="2" style="width:180px;"><Strong>답글 작성자</Strong><br/>${reply.qr_writer}<br/><br/><Strong>답글 작성(수정)일</Strong><br/><fmt:formatDate pattern="yyyy.MM.dd. HH:mm:ss" type="date" value="${reply.qr_regdate}" /></td>
		</tr>
			 
		<tr style="height:80px;">
			 <th>답글 내용</th>
			 <td colspan="3" ><u:pre value="${reply.qr_content}"/></td>
		</tr>
			 
			 <c:if test="${AUTHUSER.u_id=='adminid'}">
		<tr>
			 <td colspan="5" class="center" style="text-align:center;">
			 	<button type="button" id="btnReplyUpdate${reply.qr_no}" class="btnReplyU" id="btnReplyUpdate${reply.qr_no}" param="${reply.qr_no}">답글수정 폼 보기</button>
<%-- 			 	<button type="button" id="btnReplyDelete${reply.qr_no}" class="btnReplyD" id="btnReplyDelete${reply.qr_no}" param="${reply.qr_no}" onclick="location.href='<%=request.getContextPath()%>/qna/deleteReply?qr_no=${reply.qr_no}&qr_orino=${qna.q_no}';">답글삭제</button> --%>
				<button type="button" id="btnReplyDelete${reply.qr_no}" class="btnReplyD" id="btnReplyDelete${reply.qr_no}" onclick="deleteReplyConfirm();">답글 삭제</button>
<%-- onclick="deleteReplyConfirm(${reply.qr_no}, ${qna.q_no});  함수에 파라미터 2개 담아서 넘기기 형식--%>
			 </td>
		 </tr>
			</c:if>
	 </tbody>
 </table>
 </form>
 <br/>
 <%-------------------답글 수정 폼 --------------------------- -------------%>
<%-- forEach 반복문을 돌리기 때문에 id가 유니크 하려면 id 뒤에 ${reply.no}를 꼭 붙여 줘야한다. 각각의 댓글에 해당하는 id처럼  --%>
 <form name = "frmModiReply" id="frmModiReply${reply.qr_no}" 
 		action="<%=request.getContextPath()%>/qna/modifyReply" method="post"
 		style ="display:none;">
 <input type="hidden" name="pageNo" id="pageNo${reply.qr_no}" value="${pageNo}"/>
 <input type="hidden" name="qr_orino" id="qr_orino${reply.qr_no}" value="${qna.q_no}"/>
 <input type="hidden" name="qr_no" id="qr_no${reply.qr_no}" value="${reply.qr_no}"/> 
 
 <table id="rep3" border="1">
	 <tbody>
		 <tr style="height:30px;">
			<th>답글제목</th>
			<td colspan="3">
			<input type="text" name="qr_title" id="qr_title${reply.qr_no}" onclick="loginChk()" style="width:619px; height:30px;" value="${reply.qr_title}"/>
			</td>
		</tr>
			 
		<tr style="height:150px;">
			<th>답글내용</th>
			<td colspan="3">
			<textarea name="qr_content" id="qr_content${reply.qr_no}" cols="90" rows="10" onclick="loginChk()" placeholder="타인을 배려하는 마음을 담아 댓글을 작성해주세요.&#10;내용에 따라 이용약관 및 관련 법률에 의해 임의 조치를 수행 할 수 있습니다.">${reply.qr_content}</textarea>
			</td>
		</tr>

		<tr>
			 <td colspan="4" class="center" style="text-align:center;">
<%-- 			 <button type="button" id="btnModiReply${reply.qr_no}" class="btnModiR" param="${reply.qr_no}"  --%>
<%-- 			 	onclick="location.href='<%=request.getContextPath()%>/qna/modifyReply?q_no=${qna.q_no}';">답글 수정(처리)하기</button> --%>
			 <input type="submit" id="btnModiReply${reply.qr_no}" class="btnModiR" param="${reply.qr_no}" value="답글 수정 하기"/>
			 <button type="button" id="btnModiCancel${reply.qr_no}" class="btnModiC" param="${reply.qr_no}">답글수정취소</button>
			 </td>
		</tr>
	 </tbody>
 	</table><%-- 답글상세 테이블 끝 --%>
 	</form>
 <br/>
 	</c:forEach>
 </c:if>
 
 <br/><br/>
 
 
 
 <%---------------------------- 답글등록 폼 -----------------------------------%>
<c:if test="${AUTHUSER.u_id=='adminid'}">
 <form name = "frmInsReply" id="frmInsReply" 
 		action="<%=request.getContextPath()%>/qna/writeReply" method="post">
 <input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
 <input type="hidden" name="oriNo" id="oriNo" value="${qna.q_no}"/>
 <input type="hidden" name="qr_writer" id="qr_writer" value="${sessionScope.AUTHUSER.u_id}"/> 
 <table id=rep1 border="1">
	 <tbody>
<!-- 		<tr> -->
<%-- 			<th>답글 작성자</th><td colspan="3">${sessionScope.AUTHUSER.u_id}</td> --%>
<!-- 		</tr> -->
		 <tr style="height:25px;">
			<th>답글 제목</th>
			<td colspan="4">
			<input type="text" name="qr_title" id="qr_title" style="width:619px; height:30px;" required="required" placeholder="답변 제목을 입력해주세요."/>
			</td>
		</tr>
			 
		<tr style="height:150px;">
			<th>답글 내용</th>
			<td colspan="4">
			<textarea name="qr_content" id="qr_content" cols="90" rows="10" required="required" style="resize: none;" placeholder="답변 내용을 입력해주세요."></textarea>
			</td>
		</tr>

		<tr style="height:30px;">
			 <td colspan="5" class="center" style="text-align:center;">
			 <button type="submit" id="btnInsReply_ajax">답글쓰기</button>
			 </td>
		</tr>

	 </tbody>
 </table>
 
 </form>
 
 </c:if>
 

 

</body>
</html>






