<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
<style>
   .successWrap {
      margin: 120px auto;
      padding-top: 40px;
      padding-bottom: 40px;
      width: 800px;
      background-color: #1D3124;
      border-radius: 20px;
   }
   .successInner {
      width: 700px;
      margin: 0 auto;
      text-align: center;
      color: #F6F4E8;
   }
   .successBtn {
      display: inline-block;
      width: 100px;
      height: 30px;
   }
   .successBtn button {
      width: 100%;
      height: 100%;
      border-radius: 10px;
      border: none;
      background-color: #F6F4E8;
      font-weight: bold;
      cursor: pointer;
   }
</style>
</head>
<body>
<div class="successWrap">
   <div class="successInner">
      <p style="font-size: 35px; font-weight: 700;">
         감사합니다.<br />
         주문이 완료되었습니다.
      </p>
   </div>
   <div class="successInner" style="border-top: 2px solid #F6F4E8; border-bottom: 2px solid #F6F4E8;">
      <p style="font-size: 30px; font-weight: 900;">주 문 번 호</p>
      <h1 style="font-size: 75px; margin-top: 20px;">${order.call_no}</h1>
   </div>
   <div class="successInner" style="margin-top: 40px;">
      <p style="font-size: 20px; margin-bottom: 34px;">메뉴가 준비되면 <span style="background-color: red;">주문번호</span>로 안내드리겠습니다.</p>
      <div class="successBtn" style="margin-right: 15px; cursor: pointer;"><button onclick="location.href='${conPath}/'">메 인</button></div>
      <div class="successBtn"><button>상세 내역</button></div>
   </div>
</div>
</body>
</html>