<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>

	
	
	
	div.desc {
		padding: 2px;
		text-align: center;
	}
	.menu {
		display: inline-block;
		margin: 15px;
		width: 130px;
		height: 40px;
		line-height: 40px;
		text-align: center;
		border-radius: 20px;
		background-color: #aaa;
	}
	.menu a {
		text-decoration: none;
		color: white;
	}
	.smenu {
		display: inline-block;
		margin: 15px;
		width: 130px;
		height: 40px;
		line-height: 40px;
		text-align: center;
		border-radius: 20px;
		background-color: #FFE08C;
	}
	.smenu a {
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
	<div class="summary">
	<h3 style="text-align: center;">스터디카페 먹거리 주문</h3>
	<c:choose>
		<c:when test="${type == 0}">
			<div class="smenu">
				<a href="${contextPath}/food/main">전체</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="menu">
				<a href="${contextPath}/food/main">전체</a>
			</div>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${type == 1}">
			<div class="smenu">
				<a href="${contextPath}/food/main?type=1">식사류</a>
			</div>
		</c:when>
		<c:otherwise>
	<div class="menu">
		<a href="${contextPath}/food/main?type=1">식사류</a>
	</div>
	</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${type == 2}">
			<div class="smenu">
				<a href="${contextPath}/food/main?type=2">라면류</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="menu">
				<a href="${contextPath}/food/main?type=2">라면류</a>
			</div>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${type == 3}">
			<div class="smenu">
				<a href="${contextPath}/food/main?type=3">음료(캔)</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="menu">
				<a href="${contextPath}/food/main?type=3">음료(캔)</a>
			</div>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${type == 4}">
			<div class="smenu">
				<a href="${contextPath}/food/main?type=4">음료(카페)</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="menu">
				<a href="${contextPath}/food/main?type=4">음료(카페)</a>
			</div>
		</c:otherwise>
	</c:choose>
	</div>
	<div class="summary">
	<div id="myBtnContainer">
  <button class="btn active" onclick="filterSelection('all')"> 전체</button>
  <button class="btn" onclick="filterSelection('meals')"> 식사류</button>
  <button class="btn" onclick="filterSelection('ramens')"> 라면류</button>
  <button class="btn" onclick="filterSelection('candrinks')"> 음료(캔)</button>
  <button class="btn" onclick="filterSelection('cafedrinks')"> 음료(카페)</button>
	</div>
	<div class="container">
	<c:forEach var="list" items="${list}">
		<div class="filterDiv ${list.type}">
	  		<a href="${contextPath}/food/addCart?food_no=${list.food_no}&type=${type}">
	    		<img src="${contextPath}/resources/assets/images/food/${list.fileName}" alt="food image" width="600" height="300">
	 		</a>
		<div class="desc">${list.food_name}</div>
		<div class="desc">${list.food_price}원</div>
		</div>
	</c:forEach>
	</div>
	</div>
<script>
filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("filterDiv");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}

// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>
</body>
</html>