<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkpw</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>

<script>
	function confirmPw(){
		let obj = $("#q_openpw").val();
		//alert(obj);
		
		if(obj== ${qna.q_openpw}){
			alert("문의글 열람 성공");
<%-- 			location.href='<%=request.getContextPath()%>/qna/read?pageNo=${pageNo}&rowSize=${rowSize}'; --%>
			location.href='<%=request.getContextPath()%>/qna/read?no=${qna.q_no}&pageNo=${pageNo}&rowSize=${rowSize}';
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			obj="";
		}
			
	}


</script>

<body>
	<h3></h3>
	<hr/>
	<br/><br/><br/>
<form name="secPwFrm" id="secPwFrm" action="<%=request.getContextPath()%>/qna/read" method="post">
 <input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
 <input type="hidden" name="rowSize" id="rowSize" value="${rowSize}"/> 
 

	 <table id=secPw border="1" style="margin:0 auto;">
	 <tbody>
<!-- 		<tr> -->
<%-- 			<th>답글 작성자</th><td colspan="3">${sessionScope.AUTHUSER.u_id}</td> --%>
<!-- 		</tr> -->
		 <tr style="height:25px;">
			<th>비밀글 비밀번호 입력</th>
			<td style="width:width:180px;">
			<input type="password" name="q_openpw" id="q_openpw" style="height:30px;" required="required" placeholder="비밀글 열람을 위한 비밀번호 입력."/>
			</td>
		</tr>

		<tr style="height:30px;">
			 <td colspan="2" class="center" style="text-align:center;">
			 <button type="button" id="secPwConfirmBtn" onclick="confirmPw();">확인</button>
			 <button type="button" id="secPwCancelBtn" onclick="location.href='<%=request.getContextPath()%>/qna/list';" >취소(전체목록)</button>
			 </td>
		</tr>

	 </tbody>
 </table>
 </form>
 <br/><br/><br/>

</body>
</html>