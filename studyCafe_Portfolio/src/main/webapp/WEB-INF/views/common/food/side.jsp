<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>

<br/>
<br/>
<br/>
<br/>
<div style="border: solid black 1px; margin-right: 15px;">
	<div style="padding: 7px; border-bottom: 1px solid black; background-color: #666699; color: white;"><h4 style="margin:0; text-align: center;">주문 목록</h4></div>
	<div>
<div id="cartList"></div>
<div><!--  onclick="requestPayKakao()" -->
	<button class="payBtn">결제하기</button>
</div>
<div style="height: 60px; line-height: 60px;"><span style="margin-left: 10px;">합계 : <span id="totalPrice"></span>원</span></div>
</div>
</div>


</html>