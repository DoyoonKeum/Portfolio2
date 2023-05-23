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
 		table { 
  	    width: 800px;
/*  	    height: 600px;  */
 	    margin-left: auto; 
 	    margin-right: auto; 
 	 	} 
	 	th {
	    text-align: center;
/* 	    border: 1px solid #EFEFEF; */
/* 	    background: #C5CAD7; */
	    background: #BACEC1;
	 	}
/* 	 	textarea{ width:98%; border:1px solid #CBCACA; border-radius:4px; resize: none;} */
	 	textarea{ width:97%;
	 			  padding: 7px; 
	 			  border:1px solid #CBCACA; 
	 			  border-radius:5px; 
	 			  resize: none;
	 			 }
	 	
	 	
	 	#ism{
/* 	 	  color: white; */
		  text-align: center;
/* 		  background: #7C8EBF; */
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	#bsm{
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
	 	
	 	#read{
/* 	 	  color: white; */
		  text-align: center;
/* 		  background: #7C8EBF; */
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
	 	#del{
/* 	 	  color: white; */
		  text-align: center;
/* 		  background: #7C8EBF; */
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	
 	 	#t1{ 
 	 	height:30px; 
 	 	} 
 	 	#t2{ 
 		height:30px; 
	 	} 
 	 	#t3{ 
 	 	height:30px; 
 	 	} 
 	 	#t4{ 
 		height:30px; 
 	 	} 
 	 	.c {
	    text-align: left;
/* 	    border: 1px solid #EFEFEF; */
/* 	    background: #C5CAD7 */
		padding-left : 5px; 
	 	}
	 	
	 	
	 	.input-file-button1{
		  padding: 6px 25px;
		  background-color:#4682b4;
		  border-radius: 4px;
		  color: white;
		  cursor: pointer;
		}
		
		.input-file-button2{
		  padding: 6px 25px;
		  background-color:#FF6600;
		  border-radius: 4px;
		  color: white;
		  cursor: pointer;
		}
    </style>
    
    
    
    
        <script>
      
        	$(document).ready(function(){
        		$("#modDelBtn").click(function(){
        		    //alert('첨부파일 삭제완료');
        		 $("#modDel").remove();
        		 });	  
      		
	        });
      
			
        	
        	function formSubmit(){
        		$("#modifyFrm").submit();
        		alert("게시글 수정을 완료하였습니다.");
        	};
        	
        	
        	function deleteConfirm(){
        		 if (confirm("삭제를 진행하시겠습니까?")) {
        	            alert("삭제가 완료되었습니다.");
        				location.href='<%=request.getContextPath()%>/qna/delete?no=${qna.q_no}';
        	        } else {
        	            alert("삭제가 취소되었습니다.");
        	            location.href='<%=request.getContextPath()%>/qna/modifyForm?no=${qna.q_no}&pageNo=${pageNo}&rowSize=${rowSize}';
        	        }
        	}


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
			
			
        	function mdformSubmit(){
        		
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
        					$("#modifyFrm").submit();
                    		alert("글 수정을 완료하였습니다.");
        				}else{
        					if(pw.value.length == 0){
        						alert("패스워드를 입력해주세요");
        					}else{
        						$("#modifyFrm").submit();
                        		alert("글 수정을 완료하였습니다.");
        					}
        				}
        				
       				}
        		}		
			
			
			
        	};
			
			
			
			</script>
        
        
        
        
</head>
<body>

<%-- ModifyNoticeHandler 컨트롤러에 의해 아래와 같이 Model 받았다.
	new ModifyRequest(로그인한 userid, 글번호, db의 작성자명, db의 title, db의 내용)
	request.setAttribute("modReq", modReq);
	request.setAttribute("pageNo", pageNo);
	request.setAttribute("no", no);
	request.setAttribute("rowSize", rsize);
	request.setAttribute("noticeData1", noticeData1);

*DB내용:${noticeData}<br/><br/>
*요청페이지:${pageNo}<br/><br/>
*1페이지당 게시글수:${rowSize}<br/><br/> 
${modReq}<br/><br/><br/><br/>
--%>

<%--  <a href="<%=request.getContextPath()%>/index.jsp">HOME</a> --%>
<!-- <p class="home" style="text-align: left; margin-left:150px;"> -->
<!-- <p class="home" style="margin:0 auto; max-width: 950px;"> -->
<%-- <a href="<%=request.getContextPath()%>/qna/list">HOME</a> --%>
<!-- </p> -->
 <hr/>
  
<br/><br/>
<!--  <h3>modifyForm.jsp</h3> -->
 <form name="modifyFrm" id= "modifyFrm"
 		method="post" action="<%=request.getContextPath()%>/qna/modify"> 
 <input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
 <input type="hidden" name="rowSize" id="rowSize" value="${rowSize}"/>
 <input type="hidden" name="q_no" id="q_no" value="${qna.q_no}"/>

 
 <table border="1">
 	<tr id="t1" style="height:50px;">
 		<th>게시글 번호</th>
 		<td class="c">${qna.q_no}</td>
 	</tr>
 	
 	 <tr id="t2" style="height:50px;">
 		<th>작성자명</th>
 		<td class="c">${qna.q_writer}</td>
 	</tr>

 	 <tr id="t3" style="height:50px;">
 		<th>최초 작성일</th>
 		<td class="c"><fmt:formatDate pattern="yyyy년 MM월 dd일  HH:mm:ss" type="date" value="${qna.q_regdate}" /></td>
 	</tr>
 	
 	 <tr id="t4" style="height:50px;">
 		<th>제목<b style="color:red; font-weight: 500;">*</b></th>
 		<td class="c"><%-- ${noticeData.notice.title} --%>
 		<input type="text" name="q_title" id="q_title" style="border:1px solid #CBCACA; width:480px; height:50px; border-radius:5px;" value="${qna.q_title}" placeholder="제목을 입력하세요." required="required"/>
 		</td>
 	</tr>
 	
 	 <tr>
 		<th>내용<b style="color:red; font-weight: 500;">*</b></th>
 		<td>
<%--  		<textarea name="content" id="content" rows="20" cols="60" autofocus>${modReq.content}</textarea> --%>
 		<textarea name="q_content" id="q_content" rows="20" cols="60" placeholder="내용을 입력하세요." autofocus required="required">${qna.q_content}</textarea>
 		</td>
 	</tr>
 	
 	
 	 <tr>
 	
 		<th>비밀글 <input type="checkbox" class="q_isopen" name="q_isopen" id="q_isopen" value="y"></th>
 		<td>
 		<div id="qna_pw"></div>
<!-- 	   	<input type="password" name="q_openpw" id="q_openpw"> -->	
 		</td>
 		
 	</tr>
 	
 	
 	 <tr style="height:50px;">
 		<td colspan="2" style="text-align:center;">
<!--  		<input type="submit" id="ism" value="수정하기"/> -->
 		<button type="button" id="bsm" onclick="mdformSubmit();">수정하기</button>
 		</td>
 	</tr>
 	
 	 <tr style="height:50px;">
 		<td colspan="2" style="text-align:center;">
 		<button type="button" id="list" onclick="location.href='<%=request.getContextPath()%>/qna/list?pageNo=1&rowSize=5';">처음 목록보기</button>
 		<button type="button" id="list" onclick="location.href='<%=request.getContextPath()%>/qna/list?pageNo=${pageNo}&rowSize=${rowSize}';">이전 목록보기</button>
 		<button type="button" id="read" onclick="location.href='<%=request.getContextPath()%>/qna/read?no=${qna.q_no}&pageNo=${pageNo}&rowSize=${rowSize}';">이전(상세조회)</button>
 		<button type="button" id="del" onclick="deleteConfirm()">게시글 삭제</button>
<%--  		onclick="rmAuthCheck(${AUTHUSER.u_grade});"> --%>
 		
<%--  		<button type="button" id="del" onclick="location.href='<%=request.getContextPath()%>/qna/delete?no=${qna.q_no}'">게시글 삭제</button> --%>
<%--  		<a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${pageNo}&rowSize=${rowSize}">목록보기(파라미터 처리 안함)</a> --%>
<%--  		<a href="<%=request.getContextPath()%>/notice/read.do?no=${modReq.noticeNumber}&pageNo=${pageNo}&rowSize=3">글 상세조회(모델보면서 보완예정)</a> --%>
<%--  		<a href="<%=request.getContextPath()%>/notice/read.do?no=${modReq.noticeNumber}">뒤로(글상세조회)</a> --%>
<%--  		<a href="<%=request.getContextPath()%>/notice/delete.do?no=${modReq.noticeNumber}">글삭제(delete용)</a> --%>
<%--  		<a href="<%=request.getContextPath()%>/notice/delete2.do?no=${modReq.noticeNumber}">글삭제(update용)</a> 기능상 필요 없어 삭제--%>
 		</td>
 	</tr>
 	
 
 </table>
 		

 </form>
 
 
 <script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
 
</body>
</html>






