<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="member board Web Application with MVC">
<meta name="keywords" content="member, board, aeticle, mvc">
<meta name="viewport" content="width=device-width, initial-scale=1.0">	
<title>스터디카페</title>
<script src="https://code.jquery.com/jquery-2.2.4.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
        /* 전체 페이지에 대한 스타일링 */
        body {
            background-color: #f1f1f1;
            font-family: Arial, sans-serif;
        }

        /* 로그인 폼에 대한 스타일링 */
        form.login-form {
            background-color: #ffffff;
            border-radius: 10px;
            border: 1px solid #cccccc;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin: auto;
            padding: 30px;
            width: 350px;
        }

        /* 로그인 폼 제목에 대한 스타일링 */
        form.login-form h1 {
            margin-top: 0;
            text-align: center;
        }

        /* 입력 필드와 라벨에 대한 스타일링 */
        form.login-form label,
        form.login-form input[type="text"],
        form.login-form input[type="password"] {
            display: block;
            font-size: 16px;
            margin-bottom: 15px;
            width: 100%;
        }

        /* 입력 필드에 대한 스타일링 */
        form.login-form input[type="text"],
        form.login-form input[type="password"] {
            background-color: #f9f9f9;
            border: none;
            border-radius: 5px;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
            font-family: inherit;
            font-size: 14px;
            padding: 10px;
        }

        /* 입력 필드 포커스 시 스타일링 */
        form.login-form input[type="text"]:focus,
        form.login-form input[type="password"]:focus {
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.2);
            outline: none;
        }

        /* 로그인 버튼에 대한 스타일링 */
        form.login-form input[type="submit"] {
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            cursor: pointer;
            font-size: 16px;
            padding: 10px;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        /* 로그인 버튼 호버 시 스타일링 */
        form.login-form input[type="submit"]:hover {
            background-color: #3e8e41;
        }
        .ht{text-align:center;
        	
        }
</style>
<script>
const autoHyphen2 = (target) => {
	  target.value = target.value
	    .replace(/[^0-9]/g, '')
	   .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	 }
	 
$(document).ready( function(){
	
	 $("#btn").click( function() {
		if($("#u_pass").val()==""){ 
			alert("기존비밀번호를 입력하세요.");
			$("#u_pass").focus();
			return false; 
		}
		if($("#u_pass1").val()==""){ 
			alert("새로운비밀번호를 입력하세요.");
			$("#u_pass1").focus();
			return false; 
		}
		if($("#u_pass2").val()==""){ 
			alert("비밀번호재확인을 입력하세요.");
			$("#u_pass2").focus();
			return false; 
		}
		if($("#u_name").val()==""){ 
			alert("이름을 입력하세요.");
			$("#u_name").focus();
			return false; 
		}
		if($("#u_tell").val()==""){ 
			alert("전화번호를 입력하세요.");
			$("#u_tell").focus();
			return false; 
		}
		if($("#u_pass2").val()!=$("#u_pass1").val()){ 
			alert("비밀번호를 같게 해주세요.");
			$("#u_pass2").focus();
			return false; 
		}
		if($("#u_tell").val().length<13 && $("#u_tell").val()!=""){ 
			alert("전화번호는 예)010-1234-1234로 입력하세요.");
			$("#u_tell").focus();
			return false; 
		}
	});
});

		if( ${msg != null}) {
	    	alert('${msg}');
		}
	
</script>
<body>
<h1 class="ht">회원정보수정</h1>

<form action="<%=request.getContextPath() %>/user/modiUser" method="post" class="login-form" name="loginFrm">
	
	<input type="hidden" id="u_number" name="u_number" value="${AUTHUSER.u_number}" />
	아이디	<input type="text" name="u_id" id="u_id" readonly value="${AUTHUSER.u_id }"><br/>
	기존비밀번호 <input type="password" name="u_pass" id="u_pass" ><br/>
	비밀번호	<input type="password" name="u_pass1" id="u_pass1" ><br/>
	비밀번호재확인	<input type="password" name="u_pass2" id="u_pass2" ><br/>
	이름		<input type="text" name="u_name" id="u_name"  value="${AUTHUSER.u_name }"><br/>
	성별		<br/>
		<c:if test="${AUTHUSER.u_gender eq '남' }">
			<input type="radio" name="u_gender" id="u_gender"  value="남" checked="checked" />남
			<input type="radio" name="u_gender" id="u_gender"  value="여" />여 <br/><br/>
		</c:if>
		<c:if test="${AUTHUSER.u_gender eq '여' }">
			<input type="radio" name="u_gender" id="u_gender"  value="남" />남
			<input type="radio" name="u_gender" id="u_gender"  value="여" checked="checked" />여 <br/><br/>
		</c:if>
	전화번호	<input type="text" name="u_tell" id="u_tell"  value="${AUTHUSER.u_tell}" oninput="autoHyphen2(this)" maxlength="13"><br/>
	
	
	
	<input type="submit" value="정보수정" id="btn" />
	
</form>
</body>
</html>