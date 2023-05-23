<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<h3>장바구니</h3>
<c:if test="${empty list}">
장바구니가 비어있습니다
</c:if>
<c:if test="${not empty list}">
<table>
	<thead>
		<tr>
			<th>상품명</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
	</thead>
<c:forEach var="list" items="${list}">
	<tr>
		<td>${list.food_name}</td>
		<td>${list.quantity}</td>
		<td>${list.food_price}</td>
	</tr>
</c:forEach>
</table>
</c:if>
</body>
</html>