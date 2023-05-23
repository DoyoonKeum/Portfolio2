<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <title></title>
 <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

       <style>

		.t1{ 
		width: 1150px;
 	    margin-left: auto; 
 	    margin-right: auto; 
/* 		border: 1px solid black; */
  	    text-align: center;
/*    	    border-collapse: separate; border-radius: 8px; */
 	 	} 
 	 	
 	 	.hang{ 
		height:50px;
 	 	} 
 	 	
 	 	tr:hover {background-color: #dcdcdc;}
	 	
	 	th {
/*  	border: 1px solid #bcbcbc; */
/* 		border: 1px solid #EFEFEF; */
	 	}
	 	
	 	#nu{ width:50px; background: #BACEC1;
	 	}
	 	#ti{ width:230px; background: #BACEC1;
	 	}
	 	#wr{ width:90px; background: #BACEC1;
	 	}
	 	#rd{ width:180px; background: #BACEC1;
	 	}
	 	#md{ width:180px; background: #BACEC1;
	 	}
	 	#ct{ width:60px; background: #BACEC1;
	 	}
	 	#ca{ width:60px; background: #BACEC1;
	 	}
	 	#as{ width:90px; background: #BACEC1;
	 	}
	 	#rf{ width:60px; background: #BACEC1;
	 	}
 /*background: #C5CAD7; 원본색상 */
	 	td {
	    width: 120px;
/*   	    border: 1px solid #bcbcbc; */
		
	 	}
	 	
 	 	tr { 
 	    height: 60px; 
/*  	    border: 1px solid #bcbcbc; */
		
 	 	} 
	 	
	 	h1 { text-align: center; }

		#bwr {margin:0 auto; max-width:1150px; inline-block;}
		#sch {margin:0 auto; max-width:1150px; inline-block;} 
	 	#sub{
/* 	 	  color: white; */
		  text-align: center;
/* 		  background: #7C8EBF; */
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	#wri{
/* 	 	  color: white; */
		  text-align: center;
/* 		  background: #7C8EBF; */
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
		
		#list{
/* 	 	  color: white; */
		  text-align: center;
/* 		  background: #7C8EBF; */
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
/* 	 	------------------------------------------------------------------ */
	 	.paging {
		  display: inline-block;
		}
		
		.paging a {
		  color: black;
		  float: left;
		  padding: 8px 16px;
		  text-decoration: none;
		}
		
		.paging a.active {
		  background-color: #4CAF50;
		  color: white;
		  border-radius: 5px;
		}
		
		.paging a:hover:not(.active) {
		  background-color: #ddd;
		  border-radius: 5px;
		}
	 	
        </style>
        
        
        <script>
        	$(document).ready(function(){
//         		alert("asdsd");
        		//게시물 출력수 선택
        		//<select name="rowSize" id="rowSize";">에 이벤트
        		$("#rowSize").change(function(){  //
        			//let val = $("select#rowSize option:selected").val(); //띄어쓰기==>  select의 자식요소 option
        			$("#rowSizeFrm").submit();
        		});
        		
        	});

		
    	    function authCheck(auth){ 
				//alert(auth);
 	          if(auth==null){ 
	             alert("권한이 없습니다. 로그인이 필요합니다.");
 	             location.href='<%=request.getContextPath()%>/qna/list?rowSize=${rowSize}';
 	          }else{
 	            location.href='<%=request.getContextPath()%>/qna/writeForm?pageNo=${pageNo}&rowSize=${rowSize}';
	          }
 	          
	    	}
    	    
    	    function name() {
				
			}
        
        </script>
    
    <script type="text/javascript">
    function getpw(pwpw) {
    	   
    	   var xmlhttp = new XMLHttpRequest();

    	   //서버에서 응답 후 처리 로직.
    	      xmlhttp.onreadystatechange = function(){
    	      if(xmlhttp.readyState==4 && xmlhttp.status==200){
    	         //alert("테스트");
    	         //alert(xmlhttp.responseText);
    	         var data = JSON.parse(xmlhttp.responseText);
    	       	         
    	        
    	      }
    	   };
    	      
    	      //get 방식으로 파라미터 보내는법...
    	      xmlhttp.open("get" , "/qna/getReadpw?no="+pwpw); 
    	      xmlhttp.send();
    	   }
    
    function checkpassword(no) {
    	var passwd = prompt('패스워드를 입력하세요');
    		getpw(no);
	}
    
    </script>
    
    

</head>
<body>
<%-- 컨트롤러에 의해서 아래와 같이 Model을 받았다   23.01.13. 받는 모델을 변경!!!!! listNotice에서 NoticePage로
List<Notice> listNotice=~~~~;
 request.setAttribute("listNotice", listNotice); 
 
 NoticePage noticePage<=목록+페이징처리 관련내용.
 request.setAttribute("qnaPage", qnaPage);
 request.setAttribute("pageNo", pageNo);
 request.setAttribute("rowSize", rowSize);
 request.setAttribute("searchPage", searchPage);
 request.setAttribute("choice", choice);
 request.setAttribute("keyword", keyword);
 --%>

<%-- <%=session.getValue("AUTHUSER") %> --%>
<%-- <%=session.getAttribute("AUTHUSER") %> --%>
<%-- <%=session.getAttribute("grade") %> --%>
<%-- <%=session.getValue("AUTHUSER") %> --%>
<%-- ${AUTHUSER.emp_grade} --%>

<%--
${noticePage.getContent()} <hr/><hr/><hr/>
${noticePage.content} <hr/><hr/><hr/> --%>

<%-- ${keyword} --%>

<!-- <p class="home" style="margin:0 auto; max-width: 950px;"> -->
<%-- <a href="<%=request.getContextPath()%>/qna/list">HOME</a> --%>
<!-- </p> -->
<%--  ${qnaPage.keyword} --%>
<%--  ${param.keyword} --%>
<%--  ${param.choice} --%>
<!-- 위나 아래나 결과는 같다 -->
<%--  ${keyword} --%>
<%--  ${choice} --%>

<br/><br/><br/><br/>

 <form name="rowSizeFrm" id="rowSizeFrm" action="<%=request.getContextPath()%>/qna/list" method="post">
<div id="sch" style="text-align:right;">
<%--  <input type="hidden" name="keyword" id="keyword" value="${param.keyword}"/> --%>
<%--   <input type="hidden" name="choice" id="choice" value="${param.choice}"/> --%>
   <input type="hidden" name="keyword" id="keyword" value="${keyword}"/>
  <input type="hidden" name="choice" id="choice" value="${choice}"/>
 	게시물수 : 
	<select name = "rowSize" id = "rowSize" >
			<option value="" disabled>선택</option>
			<option value="1" <c:if test="${rowSize == 1}">selected</c:if>>1</option>
         	<option value="3" <c:if test="${rowSize == 3}">selected</c:if>>3</option>
         	<option value="5" <c:if test="${rowSize == 5}">selected</c:if>>5</option>
         	<option value="10" <c:if test="${rowSize == 10}">selected</c:if>>10</option>
    </select> 
</div>
 </form>

 <div id="bwr" style="text-align:left;">
 	<button type="button" id="wri" onclick="authCheck(${AUTHUSER.u_number})">글쓰기</button>
</div>

<br/>
	
 <table class="t1" border="1" style="table-layout: fixed;">		
 	<thead>
 		<tr class="hang">
 			<th id="nu">번호</th>
 			<th id="wr">작성자</th>
 			<th id="ti">제목</th>
 			<th id="rd">작성일</th>
 			<th id="md">최종수정일</th>
 			<th id="ct">조회수</th>
 			<th id="ca">공개여부</th>
 			<th id="as">상태</th>
<!--  			<th id="rf">첨부<br/>파일</th> -->
 		</tr>
 	</thead>
 

 	<tbody>
 	<%--  keyword가 없으면서 게시글이 없는 경우 --%>
 	<%-- JSTL if조건문 이용하여 출력 --%>
 	<c:if test="${empty keyword or (keyword eq '')}">
	 	<c:if test="${qnaPage.hasNoNotices()}"> 
	 	 <tr>
	 		<td colspan="8" style="text-align:center;">게시글이 없습니다.</td>
	 	</tr>
	 	</c:if>
 	</c:if>
 	<%--  keyword가 있으면서 결과가 없는 경우 --%>
 	<%-- JSTL if조건문 이용하여 출력 --%>
 	 <c:if test="${not empty keyword or (keyword ne '')}">
	 	<c:if test="${qnaPage.hasNoNotices()}"> 
	 	 <tr>
	 		<td colspan="8" style="text-align:center;">결과가 없습니다.</td>
	 	</tr>
	 	</c:if>
 	</c:if>

 	<%-- JSTL forEach 반복문 이용하여 출력시작 
 		for(int i=1; i<=10; i++){syso (i)} 1 2 3 ....9 10  
 		for(타입 변수명 : 컬렉션명){ syso(변수명) }
 		--%>
<%--  	<c:forEach var="i" begin="1" end="10" step="1"> 
  	<c:forEach var="item" items="${listNotice}">
 		<c:out value="${item}" /><br/><br/>
 	</c:forEach>
 	<br/><br/><br/><br/><br/><br/> --%>
 	
<%--  	<c:forEach var="item" items="${listNotice}"> --%>
	<c:if test="${qnaPage.hasNotices()}"> 
 	<c:forEach var="item" items="${qnaPage.content}" varStatus="status">
 	<tr>
 		<td>${item.q_no}</td>
 		<td>${item.q_writer}</td>
 		
 	<c:if test="${AUTHUSER.u_grade==999}">
 		<td><a href="<%=request.getContextPath()%>/qna/read?no=${item.q_no}&pageNo=${qnaPage.currentPage}&rowSize=${rowSize}">${item.q_title}</a></td> 
 	</c:if>	
 	
 	<c:if test="${AUTHUSER.u_grade!=999}">
 			<c:if test="${item.q_isopen=='Y'}">
 		 		<td><a href="<%=request.getContextPath()%>/qna/read?no=${item.q_no}&pageNo=${qnaPage.currentPage}&rowSize=${rowSize}">${item.q_title}</a></td>
 			</c:if>
 			<c:if test="${item.q_isopen=='N'}">
 		 		<td><a href="<%=request.getContextPath()%>/qna/getReadwithpw?no=${item.q_no}&pageNo=${qnaPage.currentPage}&rowSize=${rowSize}">${item.q_title}</a></td>  
 			</c:if>
 	</c:if>
  		
 		<td><fmt:formatDate pattern="yyyy.MM.dd. HH:mm:ss" type="date" value="${item.q_regdate}" /></td>
 		<td><fmt:formatDate pattern="yyyy.MM.dd. HH:mm:ss" type="date" value="${item.q_moddate}" /></td>
 		<td>${item.q_cnt}</td>
 		<td>
 		<c:if test="${item.q_isopen=='Y'}">
 		<img class="file-img" src="<%=request.getContextPath()%>/resources/assets/images/qna/unlock.png" width="20px" height="30px"/>
 		</c:if>
 		<c:if test="${item.q_isopen=='N'}">
 		<img class="file-img" src="<%=request.getContextPath()%>/resources/assets/images/qna/lock.png" width="20px" height="30px"/>
 		</c:if>
 		</td>
 		<td><c:if test="${item.q_chk==1}">미답변</c:if>
 		<c:if test="${item.q_chk==2}">답변 준비중</c:if>
 		<c:if test="${item.q_chk==3}">답변 완료</c:if></td>

 	</tr>
 	</c:forEach>
 	</c:if>
 	</tbody>
  </table>	
 	
 	<br/><br/>
 	<%-- paging출력 부분 --%>
 <div id="page" style="text-align:center;">
		<c:if test="${empty keyword or (keyword eq '')}">
	 		<%-- JSTL if조건문: 이전 출력 --%>
	 		<c:if test="${qnaPage.startPage>5}">
	 		<div class="paging">
	 		 <a href="<%=request.getContextPath()%>/qna/list?pageNo=${qnaPage.startPage-5}&rowSize=${rowSize}">&laquo;</a> 
			</div>
	 	</c:if>	
	 			
	 		<%-- JSTL forEach조건문: 페이지 번호 출력 --%>
	 		<c:forEach var="pNo"
	 			begin="${qnaPage.startPage}" end="${qnaPage.endPage}">
	 			<div class="paging">
	 		 <a href="<%=request.getContextPath()%>/qna/list?pageNo=${pNo}&rowSize=${rowSize}">${pNo}</a> 
				</div>
	 		</c:forEach>
	 		
	 		<%-- JSTL forEach조건문: 다음 출력 --%>
	 		<c:if test="${qnaPage.endPage<qnaPage.totalPages}">
	 		<div class="paging">
	 		 <a href="<%=request.getContextPath()%>/qna/list?pageNo=${qnaPage.startPage+5}&rowSize=${rowSize}">&raquo;</a> 
			</div>
	 		</c:if>	
		</c:if>
		
		<c:if test="${not empty keyword or (keyword ne '')}">
		 	<c:if test="${qnaPage.hasNoNotices()}"> 
	 		 <button type="button" id="list" onclick="location.href='<%=request.getContextPath()%>/qna/list';">전체목록보기</button>		 		 
		 	</c:if>
		 	<c:if test="${qnaPage.hasNotices()}"> 
			<%-- JSTL if조건문: 이전 출력 --%>
	 		<c:if test="${qnaPage.startPage>5}">
	 		<div class="paging">
	 		 <a href="<%=request.getContextPath()%>/qna/list?pageNo=${qnaPage.startPage-5}&rowSize=${rowSize}&choice=${choice}&keyword=${keyword}">&laquo;</a> 
			</div>
	 		</c:if>	
	 			
	 		<%-- JSTL forEach조건문: 페이지 번호 출력 --%>
	 		<c:forEach var="pNo"
	 			begin="${qnaPage.startPage}" end="${qnaPage.endPage}">
	 			<div class="paging">
	 		 <a href="<%=request.getContextPath()%>/qna/list?pageNo=${pNo}&rowSize=${rowSize}&choice=${choice}&keyword=${keyword}">${pNo}</a> 
				</div>
	 		</c:forEach>
	 		
	 		<%-- JSTL forEach조건문: 다음 출력 --%>
	 		<c:if test="${qnaPage.endPage<qnaPage.totalPages}">
	 		<div class="paging">
	 		 <a href="<%=request.getContextPath()%>/qna/list?pageNo=${qnaPage.startPage+5}&rowSize=${rowSize}&choice=${choice}&keyword=${keyword}">&raquo;</a>
			</div>
	 		 </c:if>
	 		 <br/><br/>
	 		 <button type="button" id="list" onclick="location.href='<%=request.getContextPath()%>/qna/list';">전체목록보기</button>	 
	 		</c:if>	
		</c:if>
		
 </div>
 	
<!--  	--------------------------------------------------------------------------------------------------------------------------------------------- -->

 <br/><br/><br/><br/>
<!--  검색기능 폼 -->
 <form name="searchFrm" id="searchFrm" action="<%=request.getContextPath()%>/qna/list" 
 		method="post" style="text-align:center;">
<%--  <input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/> --%>
<%--  <input type="hidden" name="rowSize" id="rowSize" value="${rowSize}"/>  --%>
 <select name="choice" id="choice"> <!-- 높이:20 중간맞춤 -->
<!--     <option value="sel">선택</option> -->
    <option value="q_title" <c:if test="${choice == 'q_title'}">selected</c:if>>제목</option>
    <option value="q_writer" <c:if test="${choice == 'q_writer'}">selected</c:if>>작성자</option>
<!--     <option value="content">내용</option> -->
</select>
<lebel class="hidden"></lebel>	<!-- ?choice=title&keyword=~~~ -->
<input type="text" name="keyword" id="keyword" value="${param.keyword}"/>
 
<button type="submit" id="sub">검색</button>
 
</form>
 
 
 

</body>
</html>





