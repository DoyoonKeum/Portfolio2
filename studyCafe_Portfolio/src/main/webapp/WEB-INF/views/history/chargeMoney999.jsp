<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			font-size: 20px;
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

	</style>
</head>

<body>

	<h1>금액 충전</h1>
	<hr/>
	<form id="charge999Frm" action="<%=request.getContextPath()%>/studycafe/chargeMoney999?userNo=${userNo}" method="post">
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>${history.h_number}</td>
			</tr>
			<tr>
				<td>유저아이디</td>
				<td>${history.h_userId }</td>
			</tr>
			<tr>
				<td>남은금액</td>
				<td><fmt:formatNumber value="${history.h_wallet}" pattern="###,###"/>원</td>
			</tr>
			<tr>
				<td>충전할 금액</td>
				<td><input type="number" name="showMeTheMoney" id="showMeTheMoney"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input type="submit" name="showMeTheMoneySubmit" id="showMeTheMoneySubmit" value="충전하기">
					<input type="button" value="취소하기" onclick="location.href='<%=request.getContextPath()%>/studycafe/historyList?userNo=${userNo}'">
					<input type="hidden" name="hno" id="hno" value="${history.h_number}">
					<input type="hidden" name="userNo" id="userNo" value="${userNo}">
				</td>
			</tr>
		</table>
	
	</form>
	
</body>
</html>