<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="conPath" value="<%=request.getContextPath()%>"/>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${conPath}/resources/assets/css/reservation/reservation_Confirm_Style.css">
<meta charset="UTF-8">
<title>예약확인창</title>
<style type="text/css">

.main{
	width: 100px;
	height: 40px;
	background-color:  #1D3124;
	text-align: center;
	line-height: 40px;	
}

.main a{
	color: white;
}
</style>
</head>
<body>

	<h2 style="margin-top: 50px; margin-bottom: 50px;">현재 예약을 확인하실 수 있습니다.</h2>

  <table>
  	<thead>
  		<tr>
  			<th style="width: 120px;">예약자명</th>
  			<th style="width: 120px;">예약날짜</th>
  			<th style="width: 120px;">룸 번호</th>
  			<th>예약시간</th>
  			<th style="width: 230px; ">가격</th>
  		</tr>
  	</thead>
  	<tbody>
  	<c:forEach var="data" items="${list}">
  		<tr>
  			<td>${data.u_name}</td>
  			<td>${data.rs_date}</td>
  			<td>${data.r_number}호실</td>
  			<td style="text-align: left; padding-left: 45px;">${data.rs_time1} ${data.rs_time2} ${data.rs_time3} 
  			${data.rs_time4} ${data.rs_time5} ${data.rs_time6}</td>
  			<td>${data.rs_price}원(현장결제)</td>
  		</tr>
  	</c:forEach> 
  	</tbody>
  	
  </table>

  <div style="padding: 50px;">
  </div>
</body>
</html>