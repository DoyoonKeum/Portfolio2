<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 예약</title>
<style>
	.container{
	  display: flex;
	  justify-content: center;
	}
	

   .room_wrap {
      margin: 70px;
   }
   .room {
      margin: 10px;
      display: inline-block;
      width: 550px;
      height: 270px;
      border: 1px solid black;
   }
   .room_img {
      display: inline-block;
      float: left;
      width: 60%;
      height: 100%;
      
   }
   .room_info {
      box-sizing: border-box;
      display: inline-block;
      float: left;
      padding: 5px;
      width: 39%;
      height: 100%;
   }
   
</style>
</head>
<body>
 <div class="container">
   <div class="room_wrap">
      <div class="room">
         <div class="room_img">
         <a href="<%=request.getContextPath()%>/reservationDetailA"><img alt="StrudyRoomA" 
         	src="<%=request.getContextPath()%>/resources/assets/images/reservation/room_a.jpg"
         	style="width:100%; height:100%;"></a>
         </div>
         <div class="room_info">
            <h3 style="text-align: center;">스터디룸 A (2인실)</h3>
           	<span>2인실 소형 룸으로 면접, 과외, 화상회의등에 적합합니다.</span><br/><br/>
			<span>공간유형 : 스터디룸 </span><br/>
			<span>예약시간 : 최소 2시간 부터 </span><br/>
			<span>수용인원 : 1명 ~ 최대 2명</span><br/>
         </div>
      </div>
      <div class="room">
         <div class="room_img">
         <a href="<%=request.getContextPath()%>/reservationDetailB"><img alt="StrudyRoomB" 
         	src="<%=request.getContextPath()%>/resources/assets/images/reservation/room_b.jpg"
         	style="width:100%; height:100%;"></a>
         </div>
         <div class="room_info">
            <h3 style="text-align: center;">스터디룸 B (4인실)</h3>
            <span>4인실 독립된 룸으로 과외, 회의등에 적합합니다.</span><br/><br/>
			<span>공간유형 : 스터디룸 </span><br/>
			<span>예약시간 : 최소 2시간 부터 </span><br/>
			<span>수용인원 : 1명 ~ 최대 4명</span><br/>
         </div>
      </div>
   </div>
   <div class="room_wrap">
      <div class="room">
         <div class="room_img">
         <a href="<%=request.getContextPath()%>/reservationDetailC"><img alt="StrudyRoomC" 
         	src="<%=request.getContextPath()%>/resources/assets/images/reservation/room_c.jpg"
         	style="width:100%; height:100%;"></a>
         </div>
         <div class="room_info">
            <h3 style="text-align: center;">스터디룸 C (6인실)</h3>
            <span>6인실 대형 룸으로 스터디, 회의등에 적합합니다.</span><br/><br/>
			<span>공간유형 : 스터디룸 </span><br/>
			<span>예약시간 : 최소 2시간 부터 </span><br/>
			<span>수용인원 : 1명 ~ 최대 4명</span><br/>
         </div>
      </div>
      <div class="room">
         <div class="room_img">
         <a href="<%=request.getContextPath()%>/reservationDetailD"><img alt="StrudyRoomD" 
         	src="<%=request.getContextPath()%>/resources/assets/images/reservation/room_d.jpg"
         	style="width:100%; height:100%;"></a>
         </div>
         <div class="room_info">
            <h3 style="text-align: center;">스터디룸 D (8인실)</h3>
            <span>8인실 대형 룸으로 스터디, 회의등에 적합합니다.</span><br/><br/>
			<span>공간유형 : 스터디룸 </span><br/>
			<span>예약시간 : 최소 2시간 부터 </span><br/>
			<span>수용인원 : 1명 ~ 최대 8명</span><br/>
         </div>
      </div>
   </div>
  </div>
</body>
</html>