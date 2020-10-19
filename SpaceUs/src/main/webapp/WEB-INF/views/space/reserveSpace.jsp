<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
.image-div {
	background-color:#f7f7f7;
	border:1px solid gray;
	display:inline-block;
	width:200px;
	height: 200px;
	margin-right: 20px;
}
.fas {position: absolute; padding: 90px;}
input[type=file], .address-input {margin-bottom:20px; margin-top:10px;}
.site-btn {width: 100%; font-size: 17px;}
.nochoose {color:#e6e6e6;}
</style>

<!-- 컨텐츠 시작 -->
<!-- 헤더 -->
    <div class="hero-wrap ftco-degree-bg"
    	 style="background-image: url('${pageContext.request.contextPath }/resources/images/bg_1.jpg');
    	 		height: 400px"
    	 data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text text-center mx-auto" style="margin-bottom:50%;">
	            <h1 class="mb-4">공간 예약하기</h1>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 공간 예약 폼 시작-->
        <!-- Blog Section Begin -->
<section class="blog-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="blog-item-list">
                    <div class="blog-item large-blog">
                        <div class="bi-pic">
                            <img src="${pageContext.request.contextPath }/resources/img/blog/blog-1.jpg" alt="">
                        </div>
                        <table id="tbl-reserve1" class="table table-striped table-hover">
	                        <div class="section-title sidebar-title-b mt-5">
	                            <h6>공간 정보</h6>
	                        </div>
	                        <tr>
								<th>공간명</th>
								<th>${ space.spaceName }</th>
							</tr>
							<tr>
								<th>공간카테고리</th>
								<th>카페</th>
							</tr>
						    <tr>
						      <td>공간옵션</td>
						      <td>
						      	<c:forEach items="${optionList}" var="info" varStatus="vs">
									${ info.optionName }${ vs.last ? '' : ', '}
								</c:forEach>
							  </td>
							</tr>
						</table>
                        <table id="tbl-reserve2" class="table table-striped table-hover">
	                        <div class="section-title sidebar-title-b mt-5">
	                            <h6>예약 정보</h6>
	                        </div>
							<tr>
								<th>예약 날짜</th>
								<th><input type="date" id="D-day" onchange="selectDay(this.value)"></th>
							</tr>
							<tr>
								<th>예약 시간</th>
								<th>
									<table class="table table-bordered" style="cursor: pointer;" id="availableTime">
	                                	<tr>
											<th id="0" style="width:16.6%;">00:00 - 01:00</th>	                                
											<th id="1" style="width:16.6%;">01:00 - 02:00</th>	                                
											<th id="2" style="width:16.6%;">02:00 - 03:00</th>	                                
											<th id="3" style="width:16.6%;">03:00 - 04:00</th>	                                
											<th id="4" style="width:16.6%;">04:00 - 05:00</th>	                                
											<th id="5" style="width:16.6%;">05:00 - 06:00</th>	                                
	                                	</tr>      
	                                	<tr>       
											<th id="6">06:00 - 07:00</th>	                                
											<th id="7">07:00 - 08:00</th>	                                
											<th id="8">08:00 - 09:00</th>	                                
											<th id="9">09:00 - 10:00</th>	                                
											<th id="10">10:00 - 11:00</th>	                                
											<th id="11">11:00 - 12:00</th>	                                
	                                	</tr>      
	                                	<tr>       
											<th id="12">12:00 - 13:00</th>	                                
											<th id="13">13:00 - 14:00</th>	                                
											<th id="14">14:00 - 15:00</th>	                                
											<th id="15">15:00 - 16:00</th>	                                
											<th id="16">16:00 - 17:00</th>	                                
											<th id="17">17:00 - 18:00</th>	                                
	                                	</tr>      
	                                	<tr>       
											<th id="18">18:00 - 19:00</th>	                                
											<th id="19">19:00 - 20:00</th>	                                
											<th id="20">20:00 - 21:00</th>	                                
											<th id="21">21:00 - 22:00</th>	                                
											<th id="22">22:00 - 23:00</th>	                                
											<th id="23">23:00 - 24:00</th>	                                
	                                	</tr>
	                                </table>
                                </th>
							</tr>
						</table>
						<table id="tbl-reserve3" class="table table-striped table-hover">
	                        <div class="section-title sidebar-title-b mt-5">
	                            <h6>결제 방법</h6>
	                        </div>
						    <tr>
						      <td>
						      	<input type="radio" name="selectPay" id="pay" value="카드결제" />
						      	<label>카드결제</label>
						      </td>
						      <td>
						      	<input type="radio" name="selectPay" value="카카오페이" />
						      	<label>카카오페이</label>
						      </td>
							</tr>
						</table>
						<table id="tbl-reserve4" class="table table-striped table-hover">
	                        <div class="section-title sidebar-title-b mt-5">
	                            <h6>쿠폰사용</h6>
	                        </div>
						    <tr>
						    	<td>
							      	<select size="1" name="coupon" id="coupon" onchange="discount()">
										<option id="no" value="no" select>쿠폰 없음</option>
										<c:forEach items="${couponList}" var="info">
											<option id="${info.no}" value="${info.no}">${info.type}  <fmt:formatNumber value="${info.discount}" type="percent"/>  [만료일 : ${info.deadLine}]</option>
										</c:forEach>
									</select>
						      	</td>
							</tr>
						</table>
						<table id="tbl-reserve5" class="table table-striped table-hover">
	                        <div class="section-title sidebar-title-b mt-5">
	                            <h6>서비스 동의</h6>
	                        </div>
						    <tr>
						      <td>
						      	<input type="checkbox" name="agree" id="agree1" />
						      	<label>위 공간의 예약조건 확인 및 결제진행 동의 (필수)</label>
						      </td>
							</tr>
							<tr>
						      <td>
						      	<input type="checkbox" name="agree" id="agree2" />
						      	<label>개인정보 제3자 제공 동의 (필수)</label>
						      </td>
							</tr>
							<tr>
						      <td>
						      	<input type="checkbox" name="agree" id="agree3" />
						      	<label>개인정보 수집 및 이용 동의 (필수)</label>
						      </td>
							</tr>
						</table>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
            <!-- 결제예정금액창 -->
                <div class="blog-sidebar">
                    <div class="subscribe-form">
                        <div class="section-title sidebar-title-b">
                            <h6>결제 예정금액</h6>
                        </div>
                         <form:form name="insertReservation" id="insertReservation"
                         	  action="${pageContext.request.contextPath}/reservation/insertReservation.do"
							  method="POST"
							  class="calculator-form">
							 <input type="hidden" name="memberEmail" value="${ member.memberEmail }">
							 <input type="hidden" name="spaceNo" value="${ space.spaceNo }">
							 <input type="hidden" name="revNo" value="">
							 <input type="hidden" name="couponNo" value="">
		
	                         <div class="filter-input">
	                             <p>예약 날짜</p>
	                             <input type="text" name="Day" readonly>
	                         </div>
	                         <div class="filter-input">
	                             <p>예약 시간</p>
	                             <input type="text" name="startHour" value="" style="width:45%;" readonly> ~ 
	                             <input type="text" name="endHour" value="" style="width:45%;" readonly>
	                         </div>
	                         <div class="filter-input">
	                             <p>결제 방법</p>
	                             <input type="text" name="pay" readonly>
	                         </div>
	                         <div class="filter-input">
	                             <p>총 금액</p>
	                             <input type="text" name="totalPrice" readonly>
	                         </div>
	                         <button type="button" id="sub" class="site-btn">결제하기</button>
						</form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
    <!-- Blog Section End -->
    <!-- 공간 예약 폼 끝-->

<script>
var avail = new Array();
var today;
$(function(){
	//객체배열에 넣기
	<c:forEach items="${availList}" var="info">
		var hour = new Object();
		hour.day="${info.day}";
		hour.start="${info.startHour}";
		hour.end="${info.endHour}";
		avail.push(hour);
	</c:forEach>
	//alert("avail="+JSON.stringify(avail));

	//오늘 날짜 구하기
    var now = new Date();
    today = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 23, 59, 59);
    console.log(today);

    for(var i=0; i<24; i++){
		$("#"+i).addClass("nochoose");
	}
});

//예약 날짜 클릭이벤트
var index=-1;
var start=-1;
var end=-1;
function selectDay(val){
	var week = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];
	
	var date = new Date(val);
	if(date.getTime() <= today.getTime()){
		alert("오늘과 지난 날짜는 예약이 불가능합니다.");
		$("#D-day").val('');
		$("[name=Day]").val('');
		
		resetHour();
		for(var i=0; i<24; i++){
			$("#"+i).addClass("nochoose");
		}
		return;
	}
	
	//날짜 선택
	var day = week[date.getDay()];
	index = avail.findIndex(obj => obj.day == day);
	
	if(index == -1){
		alert("예약가능한 시간이 없는 요일입니다. 다른 요일을 선택해주세요.");
		$("#D-day").val('');
	}
	
	//가능시간 표시
	for(var i=0; i<24; i++){
		if(index == -1)
			$("#"+i).addClass("nochoose");
		else{
			if(i >= avail[index].start && i <= avail[index].end)
				$("#"+i).removeClass("nochoose");
			else
				$("#"+i).addClass("nochoose");
		}
	}
	resetHour();

	$("[name=Day]").val($("#D-day").val());
}

//가능시간 클릭이벤트
$("#availableTime th").on("click", function(){
	//날짜,요일 선택여부
	if($("#D-day").val()==''){
		alert("예약 날짜를 먼저 선택해주세요");
		document.getElementById("D-day").focus();
		return;
	}

	if($(this).hasClass("nochoose")){
		return;
	}

	if(start == -1){
		start = Number($(this).attr("id"));
		//console.log("start : "+ start);
		//셀 색 바꾸기
	    $(this).addClass("bg-primary");
	    return;
	}

	if(end != -1){
		resetHour();
		return;
	}
	
	end = Number($(this).attr("id"));
	if((end) == start){
		$(this).removeClass("bg-primary");
		start=-1;
		end=-1;
		return;
	}
	else{
		if(end<start){
			var temp = start;
			start = end;
			end = temp;
		}
		
		$("[name=startHour]").val(start);
		$("[name=endHour]").val(end+1);
		
		for(var i=start; i<=end; i++)
			$("#"+i).addClass("bg-primary");
		return;
	}
    
});

//초기화
function resetHour(){
	index=-1;
	start=-1;
	end=-1;

	for(var i=0; i<24; i++)
		$("#"+i).removeClass("bg-primary");

	$("[name=startHour]").val('');
	$("[name=endHour]").val('');
	$("[name=pay]").val('');
	$("[name=totalPrice]").val('');
	$("input:radio[name='selectPay']").removeAttr("checked");
}

</script>
<script>
$("[name='selectPay']").change(function(){
	if($("[name=endHour]").val() == ""){
		$("input:radio[name='selectPay']").removeAttr("checked");
		$("[name=pay]").val('');
		alert("시간을 설정해주세요");
		$('html, body').animate({scrollTop : $("#D-day").offset().top}, 100);
		return;
	}
	
	$("[name=pay]").val($("[name='selectPay']:checked").val());

	var totalHour = (end+1) - start;
	var totalPrice = ${ space.hourlyPrice } * totalHour;

	$("[name=totalPrice]").val(totalPrice);
});

function discount(){
	if(!$("input:radio[name='selectPay']").is(':checked')){
		$("#coupon").val("no").prop("selected", true);
		alert("결제방법을 선택해주세요");
		document.getElementById("pay").focus();
		return;
	}

	var totalPrice = $("[name=totalPrice]").val();
	var coupon = $("select[name=coupon]").val();
	$("[name=couponNo]").val(coupon);
	if(coupon == 'no')
		return;
	else{
		<c:forEach items="${couponList}" var="info">
			if(coupon == "${info.no}")
				discount = ${info.discount};
		</c:forEach>
	}

	totalPrice *= (1-discount);
	
	$("[name=totalPrice]").val(totalPrice);
};
</script>
<script>
$("#sub").on("click", function(){
	//빈칸이면 입력 요구
	if($("[name=Day]").val() == ""){
		alert("예약날짜를 선택해주세요.");
		document.getElementById("D-day").focus();
		return false;
	}

	if($("[name=endHour]").val() == ""){
		alert("시간을 설정해주세요");
		$('html, body').animate({scrollTop : $("#D-day").offset().top}, 100);
		return false;
	}

	if($("[name=pay]").val() == ""){
		alert("결제 방법을 선택해주세요.");
		document.getElementById("pay").focus();
		return false;
	}

	if($("#agree1").is(":checked") == false){
		document.getElementById("agree1").focus();
		return false;
	}
	if($("#agree2").is(":checked") == false){
		document.getElementById("agree2").focus();
		return false;
	}
	if($("#agree3").is(":checked") == false){
		document.getElementById("agree3").focus();
		return false;
	}

	iamport();
	
});

function iamport(){
	var pay = $("[name='selectPay']:checked").val();
	
	if("카드결제" == pay){
		//아임포트
		var IMP = window.IMP; // 생략가능
		IMP.init('imp84323249');
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${ space.spaceName }',
		    amount : $("[name=totalPrice]").val(),
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

		        $("[name=revNo]").val(rsp.imp_uid);
		        document.insertReservation.submit();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    
		    alert(msg);
		    
		    //나중에 지우기
		    $("[name=revNo]").val(rsp.imp_uid);
		    document.insertReservation.submit();
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
		    amount : $("[name=totalPrice]").val(),
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

		        $("[name=revNo]").val(rsp.imp_uid);
		        document.insertReservation.submit();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    
		    alert(msg);
		    
		    //나중에 지우기
		    $("[name=revNo]").val(rsp.imp_uid);
		    document.insertReservation.submit();
		});

	}

}

</script>
<script>$(function () { memberId();});</script>

<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>