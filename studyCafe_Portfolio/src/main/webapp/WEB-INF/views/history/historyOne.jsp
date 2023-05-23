<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			background-color: #4CAF50;
			color: white;
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
			color: #4CAF50;
			text-decoration: none;
		}
		.at:hover {
			color: #3e8e41;
		}
	</style>
</head>
<body>
	<h1>조회한 회원</h1>
	<table border="1">
		<c:if test="${empty history}">
		<tr>
			<td>회원이 존재하지 않습니다.</td>
		</tr>
		</c:if>
		<c:if test="${not empty history}">
		<tr>
			<th>아이디</th>
			<th>회원등급</th>
			<th>잔액</th>
			<th>이용중인 좌석</th>
			<th>정보변경</th>
		</tr>
		<tr>
			<td>${history.h_userId}</td>	
			<td>${history.h_grade}</td>
			<td>${history.h_wallet}</td>
			<td>${history.h_isUsing}</td>
			<td>
			<input type="button" value="금액충전하기" onclick="location.href='<%=request.getContextPath()%>/studycafe/chargeMoney999?userNo=${history.h_number}&hno=${history.h_number}'">
			<input type="button" value="취소하기" onclick="location.href='<%=request.getContextPath()%>/studycafe/historyList?userNo=${userNo}'">
			</td>
		</tr>
		</c:if>
	</table>
</body>
</html>