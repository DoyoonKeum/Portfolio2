<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title><tiles:insertAttribute name="title" /></title>
<link href="<%=request.getContextPath()%>/resources/assets/css/main/main.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/assets/css/food/food_main.css" rel="stylesheet" />


<style>
aside {
	width: 300px; 
	float: right;
	position: sticky; top: 0;
}

.right{
	float : right;
    text-align: right;
}

.cartTable{
    width:100%;
}
#cartList{
	width:100%;
}
.payBtn {
   float: right;
   height: 60px;
   border: none;
   background-color: #666699;
   color: #FFE08C;
   cursor: pointer;
}
</style>
</head>
<body>
			<tiles:insertAttribute name="header" />
			<aside>
				 <tiles:insertAttribute name="side" />
			</aside>
			 	<tiles:insertAttribute name="body" />
        		<tiles:insertAttribute name="footer" />
</body>
</html>