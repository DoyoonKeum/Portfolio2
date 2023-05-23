<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
	<style>
		table {
			border-collapse: collapse;
			margin-top: 20px;
			width: 100%;
		}
		th, td {
			padding: 10px;
			border: 1px solid #ddd;
			text-align: center;
			font-size:20px;
		}
		th {
			background-color: #f2f2f2;
			font-weight: bold;
			font-size: 16px;
		}
		tr:nth-child(even) {
			background-color: #f2f2f2;
		}
		form {
			margin-top: 20px;
		}
		input[type="text"] {
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 5px;
			font-size: 16px;
			width: 200px;
		}
		input[type="submit"] {
			background-color: #e3e0cf;
			color: black;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			font-size: 16px;
			cursor: pointer;
			margin-left: 10px;
		}
		input[type="submit"]:hover {
			background-color: #d1cdb4;
		}
		input[type="button"] {
			background-color: #e3e0cf;
			color: black;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			font-size: 16px;
			cursor: pointer;
			margin-right: 10px;
		}
		input[type="button"]:hover {
			background-color: #d1cdb4;
		}
		.at {
			display: block;
			margin-top: 20px;
			font-size: 16px;
			text-align: center;
			color: black;
			text-decoration: none;
		}
		.at:hover {
			color: #3e8e41;
		}
		.using{
			text-align:center;
		}
	</style>
</head>
<body>
	<h1>이용중인 회원</h1>	<a class="at" href="<%=request.getContextPath()%>/studycafe/seatSelect?userNo=${userNo}">좌석배치로 돌아가기</a>
		<hr/>
		<div class="using">
		<form name="historySearch" id="historySearch" method="GET" action="<%=request.getContextPath()%>/studycafe/historySearch">
		<input type="text" name="historySearch" id="historySearch">
		<input type="submit" value="조회하기" onclick="popup()">
		<input type="hidden" name="userNo" id="userNo" value="${userNo}">
		</form>
		</div>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>회원등급</th>
			<th>잔액</th>
			<th>이용중인 좌석</th>
			<th>정보변경</th>
		</tr>
		<c:forEach var="item" items="${historyList}">
		<tr>
			<td>${item.h_userId}</td>	
			<td>${item.h_grade}</td>
			<td><fmt:formatNumber value="${item.h_wallet}" pattern="###,###"/>원</td>
			<td>${item.h_isUsing}</td>
			<td>
			<input type="button" value="좌석정보변경" onclick="location.href='<%=request.getContextPath()%>/studycafe/seatSelect2?userNo=${userNo}&hno=${item.h_number}'">
			<input type="button" value="금액충전하기" onclick="location.href='<%=request.getContextPath()%>/studycafe/chargeMoney999?userNo=${userNo}&hno=${item.h_number}'">
			</td>
		</tr>
		</c:forEach>
		
	</table>
	
	
	
</body>
</html>