<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="cp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.js" ></script>
<script>

	$(document).ready(function(){
		$("#wri").click(function(){
			location.href='${cp}/article/addArticleForm';
		});
	});
		
</script>
       <style>

		.t1{ 
		width: 1150px;
 	    margin-left: auto; 
 	    margin-right: auto; 
/* 		border: 1px solid black; */
  	    text-align: center;
/*    	    border-collapse: separate; border-radius: 8px; */
 	 	} 
 	 	
 	 	.hang{ 
		height:50px;
 	 	} 
 	 	
 	 	tr:hover {background-color: #dcdcdc;}
	 	
	 	th {
/*  	border: 1px solid #bcbcbc; */
/* 		border: 1px solid #EFEFEF; */
	 	}
	 	
	 	#nu{ width:50px; background: #BACEC1;
	 	}
	 	#ti{ width:230px; background: #BACEC1;
	 	}
	 	#wr{ width:90px; background: #BACEC1;
	 	}
	 	#rd{ width:150px; background: #BACEC1;
	 	}
	 	#md{ width:230px; background: #BACEC1;
	 	}
	 	#ct{ width:60px; background: #BACEC1;
	 	}
	 	#ca{ width:60px; background: #BACEC1;
	 	}
	 	#as{ width:60px; background: #BACEC1;
	 	}
	 	#rf{ width:60px; background: #BACEC1;
	 	}
	 	
	 	td {
	    width: 120px;
/*   	    border: 1px solid #bcbcbc; */
		
	 	}
	 	
 	 	tr { 
 	    height: 60px; 
/*  	    border: 1px solid #bcbcbc; */
		
 	 	} 
	 	
	 	h1 { text-align: center; }

		#bwr {margin:0 auto; max-width:1150px; inline-block;}
		#sch {margin:0 auto; max-width:1150px; inline-block;} 
	 	#sub{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	#wri{
		  text-align: center;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	#sumbit{
		  text-align: center;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
		
		#list{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
/* 	 	------------------------------------------------------------------ */
	 	.paging {
		  display: inline-block;
		}
		
		.paging a {
		  color: black;
		  float: left;
		  padding: 8px 16px;
		  text-decoration: none;
		}
		
		.paging a.active {
		  background-color: #4CAF50;
		  color: white;
		  border-radius: 5px;
		}
		
		.paging a:hover:not(.active) {
		  background-color: #ddd;
		  border-radius: 5px;
		}
	 	
        </style>
        
        
<title>스터디카페</title>
</head>
<body>
	<h2 style="text-align:center;">공지사항</h2>
	<c:if test="${AUTHUSER.u_grade eq 999}">
	<div>
		<input type="button" value="글쓰기" id="wri" name="btn1" style="margin-left:1100px;" />
	</div>
	</c:if>
	<br/>
	<table class="t1" border="1" style="table-layout: fixed;">
		<tr>
			<th id="nu">번호</th>
			<th id="wr">아이디</th>
			<th id="ti">제목</th>
			<th id="rd">날짜</th>
			<th id="ct">조회수</th>
		</tr>
	<c:if test="${empty searchArticlePage.content or searchArticlePage.content eq ''}">
		<tr>
			<td colspan="5"> 게시글이 없습니다.</td>
		</tr>
	</c:if> 
 	<c:forEach items="${searchArticlePage.content }" var="article">
		<tr>
			<td>${article.a_no}</td>
			<td>${article.u_id}</td>
			<td><a href="${cp}/article/articleDetail?no=${article.a_no}">${article.a_title}</a></td>
			<td><fmt:formatDate pattern="yyyy.MM.dd. HH:mm:ss" value="${article.a_regdate}" /></td>
			<td>${article.a_cnt}</td>
		</tr>
	</c:forEach>
	</table>
	<br/>
	 <%-- paging출력 부분 --%>
	 <div style="text-align:center;">
     <%-- JSTL if조건문: 이전출력 --%>
     <c:if test="${searchArticlePage.startPage>5}">
	 <div class="paging">
       <a href="${cp}/article/searchTitle?pageNo=${searchArticlePage.startPage-5}&searchTitle=${searchTitle}">&laquo;</a>
       </div>
     </c:if>  
     <%-- JSTL forEch조건문: 페이지번호출력 --%>  
     <c:forEach var="pNo"                       
     			begin="${searchArticlePage.startPage}" 
     			end="${searchArticlePage.endPage}">
	 <div class="paging">
      <a href="${cp}/article/searchTitle?pageNo=${pNo}&searchTitle=${searchTitle}">${pNo}</a> 
      </div>
     </c:forEach>  
                                      
     <%-- JSTL if조건문: 다음출력 --%>  
     <c:if test="${searchArticlePage.endPage<searchArticlePage.totalPages}">
     	 <div class="paging">
       <a href="${cp}/article/searchTitle?pageNo=${searchArticlePage.startPage+5}&searchTitle=${searchTitle}">&raquo;</a>
       </div>
     </c:if> 
      </div>
      <br/>
	<form method="get" action="${cp}/article/searchTitle" style="text-align:center;">
		<input type="text" id="searchTitle" name="searchTitle" />
		<input type="submit" value="제목검색" id="sumbit" />
	</form>
</body>
</html>