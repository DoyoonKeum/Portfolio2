<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="cp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.js" ></script>
    <style>
 		table { 
  	    width: 800px;
/*  	    height: 600px;  */
 	    margin-left: auto; 
 	    margin-right: auto; 
 	 	} 
	 	th {
	    text-align: center;
/* 	    border: 1px solid #EFEFEF; */
	    background: #BACEC1
	 	}
/* 	 	textarea{ width:98%; border:1px solid #CBCACA; border-radius:4px; resize: none;} */
	 	textarea{ width:97%;
	 			  padding: 7px; 
	 			  border:1px solid #CBCACA; 
	 			  border-radius:5px; 
	 			  resize: none;
	 			 }
	 	
	 	
	 	#ism{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	#bsm{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	#list{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	#read{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	#del{
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
	 	#btn2{
		  text-align: center;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
 	 	#t1{ 
 	 	height:30px; 
 	 	} 
 	 	#t2{ 
 		height:30px; 
	 	} 
 	 	#t3{ 
 	 	height:30px; 
 	 	} 
 	 	#t4{ 
 		height:30px; 
 	 	} 
 	 	.c {
	    text-align: left;
/* 	    border: 1px solid #EFEFEF; */
/* 	    background: #C5CAD7 */
		padding-left : 5px; 
	 	}
	 	
	 	
	 	.input-file-button1{
		  padding: 6px 25px;
		  background-color:#4682b4;
		  border-radius: 4px;
		  color: white;
		  cursor: pointer;
		}
		
		.input-file-button2{
		  padding: 6px 25px;
		  background-color:#FF6600;
		  border-radius: 4px;
		  color: white;
		  cursor: pointer;
		}
    </style>
<script>

	$(document).ready(function(){
		
		$("#btn2").click(function(){
				location.href='${cp}/article/articleDetail?no=${article.a_no}';
		});
	});
		
</script>
<title>스터디카페</title>
</head>
<body>
<br/>
	<form action="${cp}/article/modifyArticle">
	<table border="1">
		<tr id="t1" style="height:50px;">
 			<th>게시글 번호</th>
 			<td class="c"><input type="hidden" name="a_no" id="a_no" value="${article.a_no}" />${article.a_no}</td>
 		</tr>
		<tr id="t2" style="height:50px;">
	 		<th>아이디</th>
	 		<td class="c">${article.u_id}</td>
	 	</tr>
	 	<tr id="t3" style="height:50px;">
	 		<th>최초 작성일</th>
	 		<td class="c"><fmt:formatDate pattern="yyyy년 MM월 dd일  HH:mm:ss" type="date" value="${article.a_regdate}" /></td>
 		</tr>
 		<tr id="t4" style="height:50px;">
	 		<th>제목<b style="color:red; font-weight: 500;">*</b></th>
	 		<td class="c"><%-- ${noticeData.notice.title} --%>
	 			<input type="text" name="a_title" id="a_title" style="border:1px solid #CBCACA; width:480px; height:50px; border-radius:5px;" value="${article.a_title}" placeholder="제목을 입력하세요." required="required"/>
	 		</td>
 		</tr>
 		<tr>
	 		<th>내용<b style="color:red; font-weight: 500;">*</b></th>
	 		<td>
	 		<textarea name="a_content" id="a_content" rows="20" cols="60" placeholder="내용을 입력하세요." autofocus required="required">${article.a_content}</textarea>
	 		</td>
 		</tr>
	</table>
		<br/>
		<div style="text-align:center;">
			<input type="submit" value="수정하기" id="btn1" />
			<input type="button" id="btn2" value="돌아가기" />
		</div>
	</form>
</body>
</html>