<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${conPath}/resources/assets/css/reservation/reservation_Detail_Style.css">
<title>스터디룸 A 예약 상세페이지</title>
<script type="text/javascript">
$(document).ready(function() {

const config = {
		dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    yearSuffix: '년',
        changeMonth: true,
        changeYear: true,
        minDate : +1,
        maxDate : +30,
        onSelect: function(dateText, inst) {
        	console.log(dateText);
        	$("input:checkbox").prop("checked", false);
       	$.ajax({
        		type:'POST',
        		url: '${conPath}/timeCheckA',
        	    data:{rs_date:dateText},//서버로 전송할 데이터. 예){name:"홍GD"}
        	    success:function(data,status,xhr){//정상응답후 호출되는 함수
        	         //data: 서버로부터 응답받은 내용
        	         //status: 응답코드 , /xhr: xhr헤더
        	         //서버로부터 응답받은 내용 책제목 목록인 data변수값을  JSON으로 변환
        	      let jsonInfo = JSON.parse(data);
        	      console.log(jsonInfo.time);

        	      if(jsonInfo.time.length == 0){
        	    	  $('input:checkbox').prop("disabled",false);
        	      } else{
        	    	  $('input:checkbox').prop("disabled",false);
        	    	  for (let i=0; i<jsonInfo.time.length; i++){
        	    		  
        	    		  if(jsonInfo.time[i].rs_time1 !== ""){
        	    			  $('input:checkbox[id="rs_time1"]').prop("disabled",true);
        	    		  };
        	    		  if(jsonInfo.time[i].rs_time2 !== ""){
        	    			  $('input:checkbox[id="rs_time2"]').prop("disabled",true);
        	    		  };
        	    		  if(jsonInfo.time[i].rs_time3 !== ""){
        	    			  $('input:checkbox[id="rs_time3"]').prop("disabled",true);
        	    		  };
        	    		  if(jsonInfo.time[i].rs_time4 !== ""){
        	    			  $('input:checkbox[id="rs_time4"]').prop("disabled",true);
        	    		  };
        	    		  if(jsonInfo.time[i].rs_time5 !== ""){
        	    			  $('input:checkbox[id="rs_time5"]').prop("disabled",true);
        	    		  };
        	    		  if(jsonInfo.time[i].rs_time6 !== ""){
        	    			  $('input:checkbox[id="rs_time6"]').prop("disabled",true);
        	    		  };
        	    	  } //for문 끝
        	    	  } //else문 끝
					
        	      if(
        	    		  $('input:checkbox[id="rs_time1"]').is(":disabled") == true &  $('input:checkbox[id="rs_time2"]').is(":disabled") == true &
        	    		  $('input:checkbox[id="rs_time3"]').is(":disabled") == true &  $('input:checkbox[id="rs_time4"]').is(":disabled") == true &
        	    		  $('input:checkbox[id="rs_time5"]').is(":disabled") == true &  $('input:checkbox[id="rs_time6"]').is(":disabled") == true
        	    	  
        	      )
        	      
        	      {
        	    	  alert(dateText+"에는 모든 예약이 완료되었습니다");
        	      } 
        	      
        	      } //Success 끝
       				,error:function(xhr,status,error){
        	       //오류발생시 호출되는 함수
        	       //응답을 받지 못하거나, 데이터형식을 확인하지 못할 때 호출
        	       //에러코드 => xhr.status       //예)404
        	       //에러메세지=>xhr.responseText
        	       
        	       alert("에러가 발생했습니다");
        	      }

        	      
        	    });//ajax끝 
        	    
        	} //on select 끝
} //const datepicker 끝

$(function() {
	  $("input[name='rs_date']").datepicker(config);
	});

	$("input:checkbox").on("click",function(){
		if(!$('#rs_date').val()){
			alert('날짜를 먼저 선택해야 합니다');
			$("input:checkbox").prop("checked", false);
		}
	})
	
	$("input:checkbox").on("click",function(){
		var sum = $("input:checkbox:checked").length
		var price = sum*5000;		
		$('input[name=rs_price]').attr('value',price);
	})

	
	function check(form){
		alert("check");
		return false;
	}
	
	
}); //jQuery 끝

function check() {

    var rs_time1 = document.getElementById('rs_time1');
    var rs_time2 = document.getElementById('rs_time2');
    var rs_time3 = document.getElementById('rs_time3');
    var rs_time4 = document.getElementById('rs_time4');
    var rs_time5 = document.getElementById('rs_time5');
    var rs_time6 = document.getElementById('rs_time6');

    if(
    		rs_time1.checked == false & rs_time2.checked == false &  
    		rs_time3.checked == false & rs_time4.checked == false & 
    		rs_time5.checked == false & rs_time6.checked == false 
    ) {
        alert("예약하실 시간을 선택해주세요")
        return false;
    } else{
    	return true;
    }
	
}

</script>
</head>
<body>
	<h2 class="h2" id="tt">스터디룸 A 예약 상세페이지입니다</h2>
	<hr style="height: 1px; border: 0; background: #aaa;" />
	<div class="container">
	
	<div class="aside">
	<img id="img" src="<%=request.getContextPath()%>/resources/assets/images/reservation/room_a.jpg">
	</div>
	<div class="contant">
	<form action="${contextPath}/scafe/reservationSuccess" method="post" name="form" onsubmit="return check()" >
	<!-- 회원세션을 아직 안받아와서 히든으로 임시 파라미터 주는중  -->
	<input type="hidden" name="u_number" value="${AUTHUSER.u_number}"/>
	<input type="hidden" name="r_number" value="101"/>
	<input type="hidden" name="u_name" value="${AUTHUSER.u_name}"/>
	<input type="hidden" name="r_price" value="5000"/>
	<input type="hidden" name="u_tell" value="${AUTHUSER.u_tell}"/>
	
	<div class="date"> 
	<h3>날짜 선택</h3>
	<input id="rs_date" name="rs_date" autocomplete="off" readonly="readonly" >
	</div>
	
	<div class="check">
	<h3>시간 선택</h3>
	<input type="checkbox" id ="rs_time1" name="rs_time1" value="09:00~11:00" class="rtt"> 09:00시 ~ 11:00시 <br/>
	<input type="checkbox" id ="rs_time2" name="rs_time2" value="11:00~13:00" class="rtt"> 11:00시 ~ 13:00시 <br/>
	<input type="checkbox" id ="rs_time3" name="rs_time3" value="13:00~15:00" class="rtt"> 13:00시 ~ 15:00시 <br/>
	<input type="checkbox" id ="rs_time4" name="rs_time4" value="15:00~17:00" class="rtt"> 15:00시 ~ 17:00시 <br/>
	<input type="checkbox" id ="rs_time5" name="rs_time5" value="17:00~19:00" class="rtt"> 17:00시 ~ 19:00시 <br/>
	<input type="checkbox" id ="rs_time6" name="rs_time6" value="19:00~21:00" class="rtt"> 19:00시 ~ 21:00시 <br/>
	</div>
	
	<div class="price">
	<h3>가격</h3>
	<input type="text" id="rs_price" name="rs_price" value="" readonly="readonly" > <i> 원</i>
	<br/>
	</div>
	
	<div class="sub">
	<input type="submit" value="예약하기" >
	</div>
	</form>
	</div>
</div>
<div style="margin-bottom: 40px;">
</div>

</body>
</html>