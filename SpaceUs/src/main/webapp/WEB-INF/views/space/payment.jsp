<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
</head>
<body>

	<form:form name="payment" id="payment"
	           action="${pageContext.request.contextPath}/reservation/payment.do"
			   method="POST"
			   class="calculator-form">

		 <input type="hidden" name="revNo" value="">
		 <input type="hidden" name="memberEmail" value="${ member.memberEmail }">
		 <input type="hidden" name="spaceNo" value="${ space.spaceNo }">
		 <input type="hidden" name="day" value="${ reservation.day }">
		 <input type="hidden" name="startHour" value="${ reservation.startHour }">
		 <input type="hidden" name="endHour" value="${ reservation.endHour }">
		 <input type="hidden" name="pay" value="${ reservation.pay }">
		 <input type="hidden" name="totalPrice" value="${ reservation.totalPrice }">
		 <input type="hidden" name="flag" value="">
		 
		 <input type="hidden" name="couponNo" value="${ couponNo }">
	
	</form:form>

	<script>
	
	if("카드결제" == "${ reservation.pay }"){
		//아임포트
		var IMP = window.IMP; // 생략가능
		IMP.init('imp84323249');
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${ space.spaceName }',
		    amount : ${ reservation.totalPrice },
		    buyer_email : '${ member.memberEmail }',
		    buyer_name : '${ member.nickName }',
		    buyer_tel : '${ member.memberPhone }'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;

		        //$("[name=revNo]").val(rsp.imp_uid);
		        $("[name=flag]").val("true");
		       
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        
		    	$("[name=flag]").val("false");
		    }
		    
		    $("[name=revNo]").val(rsp.imp_uid);
		    alert(msg);
		    document.payment.submit();
		});

	}
	else{

		//아임포트
		var IMP = window.IMP; // 생략가능
		IMP.init('imp84323249');
		
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${ space.spaceName }',
		    amount : ${ reservation.totalPrice },
		    buyer_email : '${ member.memberEmail }',
		    buyer_name : '${ member.nickName }',
		    buyer_tel : '${ member.memberPhone }'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;

		        $("[name=flag]").val("true");
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        
		    	$("[name=flag]").val("false");
		    }
		    
		    $("[name=revNo]").val(rsp.imp_uid);
		    alert(msg);
		    document.payment.submit();
		});

	}
	</script>
</body>
</html>