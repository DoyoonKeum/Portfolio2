<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
<body>
주문자 정보 : ~~~
주문번호 : ~~~
<script>
const IMP = window.IMP; // 생략 가능
IMP.init("imp86313206");
  
function requestPayKG() {
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "134551",
        name: "스터디카페 햇반",
        amount: "${total}",
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        if (rsp.success) {
            // 결제 성공 시 로직
        	var msg = '결제가 완료되었습니다.';
            location.href='scafe/food/success';
        } else {
            // 결제 실패 시 로직
            
        }
    });
  }
function requestPayKakao() {
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "kakaopay",
        pay_method: "card",
        merchant_uid: "U2334s",
        name: "스터디카페 햇반",
        amount: "${total}",
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        if (rsp.success) {
            // 결제 성공 시 로직
            alert(rsp.merchant_uid);
            location.href='http://localhost:8081/scafe/food/success';
        } else {
            // 결제 실패 시 로직
            
        }
    });
  }
</script>
</body>
</html>