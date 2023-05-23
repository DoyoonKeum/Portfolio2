<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<h1 class="ht">로그인</h1>
	<form class="login-form" name="loginFrm" method="post" action="./login">
	아이디	<input type="text" name="userId" id="userId"><br/>
	비밀번호	<input type="password" name="userPwd" id="userPwd">
		
		<input type="submit" value="로그인">
	</form>
</body>
</html>