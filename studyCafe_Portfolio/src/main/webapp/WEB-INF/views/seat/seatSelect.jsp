<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <meta charset="UTF-8">
  <title>Insert title here</title>
<style>
.seatBtn {
  margin: 10px;
  width: 100px;
  height: 100px;
  background-color: #f0e6d8;
  color: black;
  font-weight: bold;
  border: none;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
}

/* .seatBtn:hover {
  background-color: #3e8e41;
} */

.reserved {
  background-color: #f44336;
  cursor: not-allowed;
}

.seatBtn[value$=",1"].reserved {
  background-color: #f44336;
  cursor: not-allowed;
}

h1 {
  font-size: 36px;
  font-weight: bold;
  text-align: center;
  margin-top: 50px;
}

.at {
  color: #2196f3;
  text-decoration: none;
  font-weight: bold;
 
}

.at:hover {
  text-decoration: underline;
}

body{
	text-align:center;
}

.noti1{
	background-color:#f0e6d8;
	text-decoration: none;
  	display: inline-block;
}
.noti2{
	background-color:#f44336;
	text-decoration: none;
  	display: inline-block;
}
.usingMember{
	text-align:right;
}
</style>
<script>
    
    $(document).ready(function() {
      // 좌석 예약 및 취소 기능
      // btn value에 담긴 데이터를 콤마단위로 split하고 각각을 배열 0,1,2로 나누어 ajax를 이용해 데이터를 보낼 예정
      $(document).on("click", ".seatBtn", function() {
        var btn = $(this);
        var seatInfo = btn.val().split(",");
        var seatNumber = seatInfo[0];
        var seatUsable = seatInfo[1];
       	var hno = seatInfo[2];
        
       	// 좌석 상태 확인
        if (seatUsable == 1) {
          if (!confirm("좌석 " + seatNumber + "번을 취소하시겠습니까?")) {
            return;
          }

          // 좌석 예약 취소 기능
          $.ajax({
            url: "<%=request.getContextPath()%>/studycafe/cancelSeat",
            type: "POST",
            data: {seatNumber: seatNumber, hno: hno},
            success: function(data) {
              if(data.success) {
                alert("좌석 " + seatNumber + "번 예약 취소 완료!");
                btn.val(seatNumber + ",0"); // 버튼을 비활성 상태로 변경
                btn.removeClass("reserved"); // 버튼 클래스 변경
                location.reload();
              } else {
                alert("좌석 예약 취소 실패: " + data.message);
              }
            },
            error: function(xhr, status, error) {
              alert("좌석 예약 취소 실패: " + error);
            }
          });
        } else {
          
        	if (!confirm("좌석 " + seatNumber + "번을 선택하시겠습니까?")) {
            return;
          }

          // 좌석 예약 기능
          $.ajax({
            url: "<%=request.getContextPath()%>/studycafe/choiceSeat",
            type: "POST",
            data: { seatNumber: seatNumber,hno: hno
            		},
            success: function(data) {
              if (data.success) {
                alert("좌석 " + seatNumber + "번 예약 완료!");
                btn.val(seatNumber + ",1"); // 버튼을 예약 상태로 변경
                btn.addClass("reserved"); // 버튼 클래스 변경
                location.reload();
              } else {
                alert("좌석 예약 실패: " + data.message);
              }
            },
            error: function(xhr, status, error) {
              alert("좌석 예약 실패: " + error);
            }
          });
        }
      });
    });
    
    function usingMember(){
    	location.href="<%=request.getContextPath()%>/studycafe/historyList?userNo=${history.h_number}"
    	
    }
    
  </script>
</head>
<body>
	<h1> 좌석 선택하기 </h1>	
	
	사용 가능<input type="button" name="do" class="noti1"> 이용 중<input type="button" name="not" class="noti2">	
	<c:if test="${history.h_grade == 999}">
	<a href="<%=request.getContextPath()%>/studycafe/historyList?userNo=${history.h_number}" style="margin-left:800px; class="at">이용중인 회원</a>
	</c:if>
	<c:if test="${history.h_grade ==1}">
	<a href="<%=request.getContextPath()%>/studycafe/chargeMoney?userNo=${history.h_number}" style="margin-left:800px;" class="at">금액 충전하기</a>
	</c:if><hr/>
	
	<c:forEach var="item" items="${seat}" begin="0" end="4">
	<span style="display:inline-block;  width:200px;" >
	<button class="seatBtn ${item.s_isusing == 1 ? 'reserved' : ''}" name="chkBtn" value="${item.s_number},${item.s_isusing},${history.h_number}">${item.s_number}</button>
	<c:choose>
	<c:when test="${item.s_number == history.h_isUsing}">${history.h_userId}</c:when>
	<c:when test="${item.s_number != history.h_isUsing && item.s_isusing==0}">사용 가능</c:when>
	<c:otherwise> 사용 중</c:otherwise>
	</c:choose>
	</span>
	</c:forEach><br/><br/>
	<br/>
	<c:forEach var="item" items="${seat}" begin="5" end="9">
	<span style="display:inline-block; width:200px;">
	<button class="seatBtn ${item.s_isusing == 1 ? 'reserved' : ''}" name="chkBtn" value="${item.s_number},${item.s_isusing},${history.h_number}">${item.s_number}</button>
	<c:choose>
	<c:when test="${item.s_number == history.h_isUsing}">${history.h_userId}</c:when>
	<c:when test="${item.s_number != history.h_isUsing && item.s_isusing==0}">사용 가능</c:when>
	<c:otherwise> 사용 중</c:otherwise>
	</c:choose>
	</span>
	</c:forEach><br/><br/>
	<br/>
	<c:forEach var="item" items="${seat}" begin="10" end="14">
	<span style="display:inline-block; width:200px;">
	<button class="seatBtn ${item.s_isusing == 1 ? 'reserved' : ''}" name="chkBtn" value="${item.s_number},${item.s_isusing},${history.h_number}">${item.s_number}</button>
	<c:choose>
	<c:when test="${item.s_number == history.h_isUsing}">${history.h_userId}</c:when>
	<c:when test="${item.s_number != history.h_isUsing && item.s_isusing==0}">사용 가능</c:when>
	<c:otherwise> 사용 중</c:otherwise>
	</c:choose>
	</span>
	</c:forEach>
	<br/><br/>
	* 좌석 1일 사용료: 3000원 입니다
	* ${history.h_userId}의 현재 잔액: ${history.h_wallet}

</body>
</html>