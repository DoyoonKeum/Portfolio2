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
	 	background: #BACEC1;
	 	}
	 	
 	 	tr { 
 	    height: 50px; 
/*  	    border: 1px solid #bcbcbc; */
		
 	 	} 
	 	
	 	#u1,#u7 {
	 	width: 80px;
	 	}
		#u8,#u9,#u5{
	 	width: 80px;
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

</script>

<title>스터디카페</title>
</head>
<body>
	<h2 style="text-align:center;">회원관리</h2>
	<br/>
	<table class="t1" border="1" style="table-layout: fixed;">
		<tr>
			<th id="u1">회원번호</th>
			<th id="u2">아이디</th>
			<th id="u3">비밀번호</th>
			<th id="u4">회원이름</th>
			<th id="u5">성별</th>
			<th id="u6">전화번호</th>
			<th id="u7">회원등급</th>
			<th id="u8">수정</th>
			<th id="u9">삭제</th>
		</tr>
  	<c:forEach items="${userPage.content}" var="User">
		<tr>
			<td>${User.u_number}</td>
			<td>${User.u_id}</td>
			<td>${User.u_pass}</td>
			<td>${User.u_name}</td>
			<td>${User.u_gender}</td>
			<td>${User.u_tell}</td>
			<td>${User.u_grade}</td>
			<td><input type="button" value="수정" 
							onclick="location.href='${cp}/user/adminModiUserForm?no=${User.u_number}'"></td>
			<td><input type="button" value="삭제" id="btn2"
							onclick="location.href='${cp}/user/adminDeleteUser?no=${User.u_number}'"></td>
		</tr>
	</c:forEach>
	</table>
	
	
	<br/>
	 <div style="text-align:center;">
     <c:if test="${userPage.startPage>5}">
     <div class="paging">
       <a href="${cp}/user/userList?pageNo=${userPage.startPage-5}">&laquo;</a>
      </div>
     </c:if>  
     <c:forEach var="pNo"                       
     			begin="${userPage.startPage}" 
     			end="${userPage.endPage}">
		<div class="paging">
      <a href="${cp}/user/userList?pageNo=${pNo}">${pNo}</a> 
      </div>
     </c:forEach>  
                                      
     <c:if test="${userPage.endPage<userPage.totalPages}">
     <div class="paging">
       <a href="${cp}/user/userList?pageNo=${userPage.startPage+5}">&raquo;</a>
      </div> 
     </c:if> 
   </div>
	<br/>

 
</body>
</html>