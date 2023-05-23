<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="<%=request.getContextPath()%>"/>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${conPath}/resources/assets/css/reservation/reservation_Success_Style.css">
<meta charset="UTF-8">
<title>예약 성공하셨습니다</title>
<script type="text/javascript">
</script>
</head>
<body>

<div class="container">
	
	<h2 style="padding-bottom: 20px;">예약이 확정되었습니다.</h2>
<h4>예약자명 : ${param.u_number} </h4>
<h4>예약자명 : ${param.u_name} </h4>
<h4>예약날짜 : ${param.rs_date} </h4>
<h4>룸 번호 : ${param.r_number} 호실 </h4>
<h4>예약시간 : 
<c:if test="${not empty param.rs_time1}"></c:if> ${param.rs_time1}
<c:if test="${not empty param.rs_time2}"></c:if> ${param.rs_time2}
<c:if test="${not empty param.rs_time3}"></c:if> ${param.rs_time3}
<c:if test="${not empty param.rs_time4}"></c:if> ${param.rs_time4}
<c:if test="${not empty param.rs_time5}"></c:if> ${param.rs_time5}
<c:if test="${not empty param.rs_time6}"></c:if> ${param.rs_time6}
</h4>
<h4>예약자 전화번호 : ${param.u_tell} </h4>

<h4><fmt:formatNumber var="price" value="${param.rs_price}" pattern="###,###" />가격 : ${price}원 </h4>

<h2  style="padding-bottom: 20px; padding-top: 20px;"> Notice </h2>
<h3> 결제는 현장에서 진행됩니다. </h3>

<div class="main" onclick="location.href='<%=request.getContextPath()%>'"   >
Main
</div>

	
</div>	
	
	
	
	
</body>
</html>