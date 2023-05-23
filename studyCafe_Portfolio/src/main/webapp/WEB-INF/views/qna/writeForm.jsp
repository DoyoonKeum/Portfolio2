<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>

 <title></title>
 <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
    <style>
        .error {color:red;font-size:0.8em;}
		table {
	    width: 800px;
/* 	    height: 600px; */
	    margin-left: auto;
	    margin-right: auto;
	    border-radius: 5px;
	 	}
	 	th {
	    text-align: center;
/* 	    border: 1px solid #EFEFEF; */
	    background: #BACEC1;
	   
	 	}
/* 	 	textarea{ width:98%; border:0; resize: none;} */
	 	textarea{ width:97%;
		  padding: 7px; 
		  border:1px solid #CBCACA; 
		  border-radius:5px; 
		  resize: none;
		 }
	 	
	 	
	 	#wrb{
/* 	 	  color: white; */
		  text-align: center;
/* 		  background: #7C8EBF; */
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	#list{
/* 	 	  color: white; */
		  text-align: center;
/* 		  background: #7C8EBF; */
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	
    </style>
	<script>
//         	function wrformSubmit(){
//         		$("#writeFrm").submit();
//         		alert("글 작성을 완료하였습니다.");

//         	};
            	
        	  
//         		$(function(){
//         	        $(".q_isopen").click(function() {
//         	            if ($("input[name=q_isopen]").is(":checked")) {
//         	                $("#q_openpw").show();
// //         	                $("#q_openpw").onblur="checkpw()"
//         	            } else {
//         	                $("#q_openpw").hide();
//         	            }
//         	        })
        	 
//         	    });	
        	
       	
        	
    	 	
    	 	

        	</script>
		<script type="text/javascript">
// 			function checkpw(){
// 				var pw = document.getElementById("q_openpw").value;
// 				if(pw.length==0){
// 					alert("패스워드를 입력해주세요");
// 				}
// 			}
			
			function deletepw() {
				  const element = document.getElementById('qna_pw');
				  element.innerText = '';
				} 
			
			function createpw(){
				const element = document.getElementById('qna_pw');
				 element.innerHTML ='<input type="password" id="q_openpw" name="q_openpw" required>';
			}

				
			
			document.addEventListener('DOMContentLoaded', function() {
			    var checkboxes = document.querySelectorAll('input[type=checkbox][name=q_isopen]');
			    for (var checkbox of checkboxes)
			    {
			        checkbox.addEventListener('change', function(event)
			        {
			            if (event.target.checked) {
		                	createpw();
			            }
			            else {
			            	deletepw();
			            }
			        });
			    }
			}, false);
			
			
        	function wrformSubmit(){
        		
        		const title = document.getElementById('q_title');
        		const content = document.getElementById('q_content');
			    const checkboxes = document.getElementById('q_isopen');
			    const pw = document.getElementById('q_openpw');
        		
        		if(title.value.length == 0){
        			alert("제목을 입력해주세요");
        		}else{
        			if(content.value.length == 0){
        				alert("내용을 입력해주세요");
        			}else{
        				if(checkboxes.checked == false){
        					$("#writeFrm").submit();
                    		alert("글 작성을 완료하였습니다.");
        				}else{
        					if(pw.value.length == 0){
        						alert("패스워드를 입력해주세요");
        					}else{
        						$("#writeFrm").submit();
                        		alert("글 작성을 완료하였습니다.");
        					}
        				}
        				
       				}
        		}

        		
        

    	};
					
			</script>
</head>
<body>


<%-- 
*DB내용:${noticeData}<br/><br/>
*요청페이지:${pageNo}<br/><br/>
*1페이지당 게시글수:${rowSize}<br/><br/> --%>
<%-- ${writeReq}<br/><br/> --%>
<%-- ${pageNo} --%>
<%-- ${rowSize} --%>
<%--  <a href="<%=request.getContextPath()%>/index.jsp">HOME</a> --%>
<%--  <a href="<%=request.getContextPath()%>/view/main.jsp">HOME</a> --%>
<!-- <p class="home" style="text-align: left; margin-left:150px;"> -->
<!-- <p class="home" style="margin:0 auto; max-width: 950px;"> -->
<%-- <a href="<%=request.getContextPath()%>/qna/list">HOME</a> --%>
<!-- <h6></h6> -->
<!-- </p> -->
<hr/>

<br/><br/><br/><br/>
<!--  <h3>writeForm.jsp</h3> -->

<!--  <form name="writeFrm" id= "writeFrm" -->
<%--  		method="post" action="<%=request.getContextPath()%>/notice/write.do"> --%>
 <form name="writeFrm" id= "writeFrm" method="post" action="<%=request.getContextPath()%>/qna/write">
 <input type="hidden" id="rowSize" name="rowSize" value="${rowSize}"/>
 <input type="hidden" id="pageNo" name="pageNo" value="${pageNo}"/>
 <input type="hidden" name="u_number" id="u_number" value="${AUTHUSER.u_number}" />
  
 
 <table border="1">
 	 <tr style="height:60px;">
 		<th>작성자명</th>
<%--  		<td>${AUTHUSER.u_id}</td> --%>
	 		<td>${AUTHUSER.u_id}
	 		<input type="hidden" name="q_writer" id="q_writer" value="${AUTHUSER.u_id}"/>
	 		</td>
 	</tr>

 	 <tr style="height:60px;">
 		<th>제목<b style="color:red; font-weight: 500;">*</b></th>
 		<td><%-- ${noticeData.notice.title} --%>
 		<input type="text" name="q_title" id="q_title" style="border:1px solid #CBCACA; width:480px; height:50px; border-radius:5px;" placeholder="제목을 입력하세요.">
 		</td>
 	</tr>
 	
 	 <tr>
 		<th>내용<b style="color:red; font-weight: 500;">*</b></th>
 		<td>
 		<textarea name="q_content" id="q_content" rows="20" cols="70" autofocus placeholder="내용을 입력하세요."></textarea>
 		
 		</td>
 	</tr>

 	<tr>
 		<th>비밀글 <input type="checkbox" class="q_isopen" name="q_isopen" id="q_isopen"></th>
<!--  		<th>비밀글 <input type="checkbox" class="q_isopen" name="q_isopen" id="q_isopen" value="y"></th> -->
 		<td>
 		<div id="qna_pw"></div>
<!-- 	   	<input type="password" name="q_openpw" id="q_openpw"> -->	
 		</td>
 		
 	</tr>
 	
 	
 	 <tr>
 		<td colspan="2" style="text-align:center;">
<!--  		<input type="submit" id="wrb" value="글쓰기"/> -->
 		<button type="button" id="wrb" onclick="wrformSubmit()">글쓰기</button>
 		</td>
 	</tr>
 	
 	 <tr>
 		<td colspan="2" style="text-align:center;">
<%--  		<a href="<%=request.getContextPath()%>/notice/list.do?pageNo=1&rowSize=${rowSize}">목록보기</a> --%>
 		<button type="button" id="list" onclick="location.href='<%=request.getContextPath()%>/qna/list?pageNo=1&rowSize=5'">처음 목록보기</button>
 		<button type="button" id="list2" onclick="location.href='<%=request.getContextPath()%>/qna/list?pageNo=${pageNo}&rowSize=${rowSize}'">이전 목록보기</button>
 		</td>
 	</tr>
 	
 
 </table>
 <%--
 		<input type="hidden" name="no" id="no" value="${modReq.noticeNumber}"/>
 		<input type="hidden" name="writer_name" id="writer_name" value="${modReq.writer_name}"/>  
 		<!-- 런타임 익셉션 떨어져서 숨기고 no이름 값으로 속성을 안보이게 넘긴다.히든!! 위에 no값은 form태그 안에만 있으면 어디든 위치는 오케이다-->
 		 여기에서는 작성자명을 수정처리컨트롤러에 넘기는 방식으로 추가하였다.
 		현재방식이라면 DB의 작성자명과 세션에 담긴 이름이 동일하므로 세션으로 대체해도 된다 --%>
 </form>




<%-- <form name="frmName" method="post" enctype="multipart/form-data" 
action="<%=request.getContextPath()%>/notice/write.do">
<!--     user<br/>  -->
<!--     <input name="user"><br/> -->
<!--     title<br/>  -->
<!--     <input name="title"><br/> -->
    file<br/> 
    <input type="file" name="uploadFile"><br/><br/>
    <input type="submit" value="UPLOAD"><br/>
</form> --%>



<%-- <script src="${pageContext.request.contextPath}/resources/common/js/ckeditor.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/ckeditor.js"></script> --%>


</body>
</html>






