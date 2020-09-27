<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                        <table id="tbl-reserve" class="table table-striped table-hover">
	                        <div class="section-title sidebar-title-b mt-5">
	                            <h6>공간 정보</h6>
	                        </div>
	                        <tr>
								<th>공간명</th>
								<th>${ spaceName }</th>
							</tr>
							<tr>
								<th>공간카테고리</th>
								<th>카페</th>
							</tr>
						    <tr>
						      <td>공간옵션</td>
						      <td>와이파이, 테이블, 의자, 반려동물 동반가능</td>
							</tr>
						</table>
                        <table id="tbl-reserve" class="table table-striped table-hover">
	                        <div class="section-title sidebar-title-b mt-5">
	                            <h6>예약 정보</h6>
	                        </div>
							<tr>
								<th>예약 날짜</th>
								<th><input type="date" name="revDay" onchange="selectDay(this.value)"></th>
							</tr>
						    <tr>
						      <td>예약 시작시간</td>
						      <td><select name="" id=""></select></td>
							</tr>
							<tr>
						       <td>예약 종료시간</td>
						       <td><select name="" id=""></select></td>
							</tr>
							<tr>
								<table class="table table-bordered" style="cursor: pointer;" id="availableTime">
                                	<tr>
										<th style="width:16.6%;">00:00 - 01:00</th>	                                
										<th style="width:16.6%;">01:00 - 02:00</th>	                                
										<th style="width:16.6%;">02:00 - 03:00</th>	                                
										<th style="width:16.6%;">03:00 - 04:00</th>	                                
										<th style="width:16.6%;">04:00 - 05:00</th>	                                
										<th style="width:16.6%;">05:00 - 06:00</th>	                                
                                	</tr>
                                	<tr>
										<th>06:00 - 07:00</th>	                                
										<th>07:00 - 08:00</th>	                                
										<th>08:00 - 09:00</th>	                                
										<th>09:00 - 10:00</th>	                                
										<th>10:00 - 11:00</th>	                                
										<th>11:00 - 12:00</th>	                                
                                	</tr>
                                	<tr>
										<th>12:00 - 13:00</th>	                                
										<th>13:00 - 14:00</th>	                                
										<th>14:00 - 15:00</th>	                                
										<th>15:00 - 16:00</th>	                                
										<th>16:00 - 17:00</th>	                                
										<th>17:00 - 18:00</th>	                                
                                	</tr>
                                	<tr>
										<th>18:00 - 19:00</th>	                                
										<th>19:00 - 20:00</th>	                                
										<th>20:00 - 21:00</th>	                                
										<th>21:00 - 22:00</th>	                                
										<th>22:00 - 23:00</th>	                                
										<th>23:00 - 24:00</th>	                                
                                	</tr>
                                </table>
							</tr>
						    <tr>
						      <td>예약 인원</td>
						      <td><input type="number" name="" id="" /></td>
							</tr>
						</table>
						<table id="tbl-reserve" class="table table-striped table-hover">
	                        <div class="section-title sidebar-title-b mt-5">
	                            <h6>결제 방법</h6>
	                        </div>
						    <tr>
						      <td>
						      	<input type="radio" name="" id="" />
						      	<label>카드결제</label>
						      </td>
						      <td>
						      	<input type="radio" name="" id="" />
						      	<label>네이버페이</label>
						      </td>
							</tr>
						</table>
						
						
						<table id="tbl-reserve" class="table table-striped table-hover">
	                        <div class="section-title sidebar-title-b mt-5">
	                            <h6>서비스 동의</h6>
	                        </div>
						    <tr>
						      <td>
						      	<input type="checkbox" name="" id="" />
						      	<label>위 공간의 예약조건 확인 및 결제진행 동의 (필수)</label>
						      </td>
							</tr>
							<tr>
						      <td>
						      	<input type="checkbox" name="" id="" />
						      	<label>개인정보 제3자 제공 동의 (필수)</label>
						      </td>
							</tr>
							<tr>
						      <td>
						      	<input type="checkbox" name="" id="" />
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
                         <form action="#" class="calculator-form">
	                         <div class="filter-input">
	                             <p>예약 날짜</p>
	                             <input type="text">
	                         </div>
	                         <div class="filter-input">
	                             <p>예약 시간</p>
	                             <input type="text">
	                         </div>
	                         <div class="filter-input">
	                             <p>예약 인원</p>
	                             <input type="text">
	                         </div>
	                         <div class="filter-input">
	                             <p>총 금액</p>
	                             <input type="text">
	                         </div>
	                         <button type="submit" class="site-btn">결제하기</button>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
    <!-- Blog Section End -->
    <!-- 공간 예약 폼 끝-->

<script>
//예약 날짜 클릭이벤트
function selectDay(val){
	//alert(val);
	var week = ['일', '월', '화', '수', '목', '금', '토'];

	var day = week[new Date(val).getDay()];
	console.log(day);
	
	$.ajax({
		url : "${ pageContext.request.contextPath }/reservation/getRevAvail.do",
		method: "POST",
		dataType : "json",
		data : {
			"day" : day
		},
		success : function(data){
			//console.log(data);
			console.log("ajax연결 성공!");
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	});
}

//가능시간 클릭이벤트
$("#availableTime th").on("click", function(){
	if($(this).hasClass("bg-primary"))
    	$(this).removeClass("bg-primary");
	else
    	$(this).addClass("bg-primary");
});
</script>

<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>