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
        .error {color:red;font-size:0.8em;}
		table {
	    width: 800px;
/* 	    height: 600px; */
	    margin-left: auto;
	    margin-right: auto;
	    border-radius: 5px;
	 	}
	 	th {
	    text-align: center;
/* 	    border: 1px solid #EFEFEF; */
	    background: #BACEC1;
	   
	 	}
/* 	 	textarea{ width:98%; border:0; resize: none;} */
	 	textarea{ width:97%;
		  padding: 7px; 
		  border:1px solid #CBCACA; 
		  border-radius:5px; 
		  resize: none;
		 }
	 	
	 	
	 	#wrb{
		  text-align: center;
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
	 	#btn1{
		  text-align: center;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	
    </style>
<script>

	$(document).ready(function(){
		$("#btn1").click(function(){
			location.href='${cp}/article/articleList';
		});
	});
</script>
<title>스터디카페</title>
</head>
<body>
<br/>
	<form action="${cp}/article/addArticle">
	<table border="1">
		<tr style="height:60px;">
			<th>아이디</th>
			<td><input type="hidden" name="u_id" id="u_id" value="${AUTHUSER.u_id}"/>${AUTHUSER.u_id}</td>
		</tr>
		<tr style="height:60px;">
			<th>제목<b style="color:red; font-weight: 500;">*</b></th>
			<td>
			<input type="text" name="a_title" id="a_title"  style="border:1px solid #CBCACA; width:480px; height:50px; border-radius:5px;" required="required" placeholder="제목을 입력하세요."/>
			<span class="error"></span>
			</td>
		</tr>
		<tr>
			<th>내용<b style="color:red; font-weight: 500;">*</b></th>
			<td>
			<textarea name="a_content" id="a_content" rows="20" cols="70" required="required" autofocus placeholder="내용을 입력하세요."></textarea>
 			<input type="hidden" name="u_number" id="u_number" value="${AUTHUSER.u_number}" />
			</td>
		</tr>
	</table>
	<br/>
		<div style="text-align:center;">
			<input type="submit" value="글쓰기" id="wrb"/>
			<input type="button" id="btn1" value="목록으로" />
		</div>
			
	</form>
</body>
</html>