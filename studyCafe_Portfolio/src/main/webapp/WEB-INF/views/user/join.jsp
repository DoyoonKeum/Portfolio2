<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="${conPath}/resources/assets/css/user/joinStyle.css">
</head>
<body>
<h3>회원가입</h3>
<form action="${conPath}/join" method="post">
		<div class="container">
			<div class="content">
	<div class="field">
		<h3>아이디</h3> 
		<input type="text" id="u_id" name="u_id" required="required"> <br/> 
		<span class="error"><c:if test="${errors.duplicateId}">이미 사용중인 아이디입니다</c:if></span>
	</div>
	
	<div class="field">
		<h3>비밀번호</h3> 
		<input type="password" id="u_pass" name="u_pass" required="required">
	</div>
	
	<div class="field">
		<h3>비밀번호 확인 </h3>
		<input type="password" id="re_u_pass" name="re_u_pass" required="required"> <br>
		<span class="error"><c:if test="${errors.notMatch}">비밀번호가 일치하지 않습니다</c:if></span>
	</div>
	<div class="field">
		<h3>이름</h3> 
		<input type="text" id="u_name" name="u_name" required="required">
	</div>
	<div class="field">
		<h3>연락처</h3> 
		<input type="text" id="u_tell" name="u_tell" placeholder="숫자만 입력해주세요" pattern="[0-9]+" maxlength="11" required="required">
	</div>
	<div>
		<h3>성별 </h3>
	    <label for="contactChoice1">남자</label><input type="radio" id="contactChoice1" name="u_gender" value="male">
	    <label for="contactChoice2">여자</label><input type="radio" id="contactChoice2" name="u_gender" value="female">
    </div>
    </div>
    </div>
	<input type="hidden" name="u_grade" value="1"/>
	<div class="footer1">
					<input class="sub" type="submit" value="등록">
				</div>
				<h3  id="footertxt" ><a href="${conPath}">메인 페이지로</a></h3>
    </form>
</body>
</html>