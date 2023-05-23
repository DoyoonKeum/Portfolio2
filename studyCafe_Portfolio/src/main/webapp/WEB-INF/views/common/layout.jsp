<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/assets/css/main/main.css" rel="stylesheet" />
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<div style="min-height: 800px; width: 1200px; margin: 0 auto;">
		<tiles:insertAttribute name="body"/>
	</div>
	<tiles:insertAttribute name="footer"/>
</body>
</html>