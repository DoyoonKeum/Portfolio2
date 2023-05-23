<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .success_wrap {
      margin: 120px auto;
      width: 400px;
      text-align: center;
   }
   .success_wrap h1 {
      color: #E59560;
      font-size: 57px;
   }
   .success_wrap h2 {
      font-size: 50px;
      font-weight: normal;
   }
   .success_wrap p {
      font-size: 20px;
      color: #999;
      margin-bottom: 40px;
   }
   .success_btn {
      width: 100%;
      height: 50px;
      line-height: 50px;
      border-radius: 10px;
      background-color: #1D3124;
      cursor: pointer;
   }
</style>
</head>
<body>
   <div class="success_wrap">
      <h1>Study Cafe</h1>
      <h2>환영합니다!</h2>
      <P>
         ${user.u_name}님, 회원가입을 축하합니다.<br />
         Study Cafe의 새로운 아이디는<br />
         ${user.u_id} 입니다.
      </P>
      <div>
      	 <button class="success_btn" onclick="location.href='${conPath}'" style="font-size: 20px; font-weight: bold; color: white;">메 인 으 로</button>
      </div>
   </div>
</body>
</html>