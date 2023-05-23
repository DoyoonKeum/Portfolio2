<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
//const IMP = window.IMP; // 생략 가능
  
const IMP = window.IMP; // 생략 가능
 	  IMP.init("imp86313206");

function requestPayKG() {
	var amount = document.querySelector('input[name="price"]:checked').value;
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "USDK1231231111",
        name: "스터디카페 햇반",
        amount: amount,
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        console.log(rsp)
    	if (rsp.success) {
            // 결제 성공 시 로직
           var msg = '결제가 완료되었습니다.';
            location.href='/studycafe/seatSelect?userNo='+${userNo};
        } else {
            // 결제 실패 시 로직
            
        }
    });
  }
</script>

<style>
body {
  background-color: #f2f2f2;
  font-family: 'Nanum Gothic', sans-serif;
  font-size: 16px;
  color: #333;
}

.radio_container {
  background-color: #fff;
  border-radius: 10px;
  padding: 40px;
  text-align: center;
  box-shadow: 0 0 10px rgba(0,0,0,0.2);
}

.radioInput {
  display: inline-block;
  margin: 0 10px;
}

	.radioInput input[type="radio"] {
  display: none;
}

.radioInput span {
  display: inline-block;
  border: 2px solid #ddd;
  border-radius: 5px;
  padding: 20px 40px;
  cursor: pointer;
  transition: all 0.3s;
}

.radioInput input[type="radio"]:checked + span {
  border-color: #50c878;
  color: #50c878;
  font-weight: bold;
}
	
button {
  display: inline-block;
  margin-top: 20px;
  background-color: #f0e6d8;
  font-size:18px;
  color: black;
  border: none;
  border-radius: 5px;
  padding: 20px 20px;
  cursor: pointer;
  transition: all 0.3s;
}

/* button:hover {
  background-color: #2d6a4f;
} */
.h1 {
	text-align:center;
}
</style>
</head>
<body>
	
	<div class="radio_container" align="center">
	<div class="h1"><h1>충전하기</h1></div>
          <label class="radioInput"><input type="radio" name="price" value="5000"> <span>5,000원</span></label>
          <label class="radioInput"><input type="radio" name="price" value="10000"><span>10,000원</span></label>
          <label class="radioInput"><input type="radio" name="price" value="15000"><span>15,000원</span></label><br/>
          <label class="radioInput"><input type="radio" name="price" value="20000"><span>20,000원</span></label>
          <label class="radioInput"><input type="radio" name="price" value="25000"><span>25,000원</span></label>
          <label class="radioInput"><input type="radio" name="price" value="30000"><span>30,000원</span></label><br/>
          <label class="radioInput"><input type="radio" name="price" value="35000"><span>35,000원</span></label>
          <label class="radioInput"><input type="radio" name="price" value="40000"><span>40,000원</span></label>
          <label class="radioInput"><input type="radio" name="price" value="50000"><span>50,000원</span></label>
          <p style="color: #ac2925; margin-top: 30px">최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
    <button onclick="requestPayKG()">결제하기</button>
    </div>
	
	
</body>
</html>