<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<c:set var="cp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.js" ></script>
       <style>
		#t1 {
	    width: 800px;
	    height: 600px;
	    margin-left: auto;
	    margin-right: auto;
	 	}
	 	#t2 {
	    width: 800px;
	    margin-left: auto;
	    margin-right: auto;
	 	}
	 	th {
	    text-align: center;
/* 	    border: 1px solid #EFEFEF; */
	    background: #BACEC1;
	    width : 190px;
	 	}
	 	#th1{
	 	  width : 300px;
	 	}
	 	#th2{
	 	  width : 150px;
	 	}
	 	#th3{
	 	  width : 150px;
	 	}
	 	#th4{
	 	  width : 50px;
	 	}
	 	.c {
	    text-align: left;
/* 	    border: 1px solid #EFEFEF; */
/* 	    background: #C5CAD7 */
		padding-left : 5px; 
	 	}
	 	
	 	
	 	#list{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	#mod{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	#btn1{
		  text-align: center;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
        </style>
<script>

	$(document).ready(function(){
		$("#btn1").click(function(){
				location.href='${cp}/article/modifyArticleForm?a_no=${article.a_no}';
		});
	});
	$(document).ready(function(){
		$("#btn2").click(function(){
			if(confirm("삭제하시겠습니까?") === true) {
				location.href='${cp}/article/deleteArticle?a_no=${article.a_no}';
				alert("삭제하였습니다.")
		    }
		});
	});
	$(document).ready(function(){
		$("#btn3").click(function(){
			location.href='${cp}/article/articleList';
		});
	});

		
	
</script>
<title>스터디카페</title>
</head>
<body>
<br/>
 <table border="1" style="text-align:center;" id="t1">
		<tr  style="height:20px;">
			<th class="h">글 번호</th>
			<td class="c">${article.a_no}</td>
		</tr>
		<tr  style="height:20px;">
			<th class="h">아이디</th>
			<td class="c">${article.u_id}</td>
		</tr>
		<c:if test="${article.a_regdate eq article.a_modidate}">
		<tr  style="height:20px;">
			<th class="h">최초 작성일</th>
			<td class="c"><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${article.a_regdate}" /></td>
		</tr>
		</c:if>
		<c:if test="${article.a_regdate ne article.a_modidate}">
		<tr  style="height:20px;">
			<th class="h">마지막 수정일</th>
			<td class="c"><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${article.a_modidate}" /></td>
		</tr>
		</c:if>
		<tr  style="height:20px;">
			<th class="h">조회수</th>
			<td class="c">${article.a_cnt}</td>
		</tr>
		<tr  style="height:20px;">
			<th class="h">제목</th>
			<td class="c">${article.a_title}</td>
		</tr>
		<tr  style="height:230px;">
			<th class="h">내용</th>
			<td class="c" style="white-space: pre-wrap;"><u:pre value="${article.a_content}"/>
		</tr>
	</table>
	<br/><br/><br/>
 
	<form  action="${cp}/article/modiComment" method="get">
		<div style="text-align:center;">
			<textarea name="ac_content" id="ac_content" rows="5" cols="90" required="required">${commemt.ac_content}</textarea> 
		</div>
		<input type="hidden" id="ac_no" name="ac_no" value="${commemt.ac_no}"/>
		<input type="hidden" id="a_no" name="a_no" value="${commemt.a_no}"/>
		<br/>
		<input type="submit" value="댓글수정" style="margin-left:900px;" id="btn1"/>
	</form>
	
</body>
</html>