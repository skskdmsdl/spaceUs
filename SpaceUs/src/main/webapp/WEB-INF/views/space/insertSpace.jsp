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
</style>
<!-- 컨텐츠 시작 -->
    <div class="hero-wrap ftco-degree-bg"
    	 style="background-image: url('${pageContext.request.contextPath }/resources/images/bg_2.jpg');
    	 		height: 400px"
    	 data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text text-center mx-auto" style="margin-bottom:50%;">
	            <h1 class="mb-4">공간 등록하기</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- 공간 등록 폼 -->
    <section class="property-submit-section spad m-5">
        <div class="container ">
            <div class="row m-5">
                <div class="col-lg-12">
                    <div class="property-submit-form">
                        <form action="#">
                            <div class="pf-title">
                                <h4>공간이름<span class="text-danger">*</span></h4>
                                <input type="text">
                            </div>
                            <div class="pf-summernote">
                                <h4>공간설명<span class="text-danger">*</span></h4>
                                <textarea name="example" style="width:100%; height:350px; border: 1px solid #ebebeb; resize: none;"></textarea>
                            </div>
                            <div class="pf-location">
                                <h4>공간주소<span class="text-danger">*</span></h4>
                                <div style="display:inline-block; width:40%">
	                                <input class="zipCode-input" type="text" placeholder="우편번호"/>
	                            </div>
                                <div style="display:inline-block; width:40%">
		                            <button type="button" class="btn btn-primary ml-4 p-10">주소 검색</button>
	                            </div>
                                <input class="address-input" type="text">
                                <input class="detail-address-input" type="text" placeholder="상세주소를 입력해주세요">
                            </div>
                            <div class="pf-phone" style="margin-bottom: 45px;">
                                <h4>공간전화번호<span class="text-danger">*</span></h4>
                                 	<input type='tel' name='phone1' style="width: 10%"/>&emsp;ㅡ&emsp;
							        <input type='tel' name='phone2' style="width: 10%"/>&emsp;ㅡ&emsp;
							        <input type='tel' name='phone3' style="width: 10%"/>
                            </div>
                            <div class="pf-type">
                                <h4>카테고리 선택<span class="text-danger">*</span></h4>
                                <table class="table table-bordered" id="categoryTb">
                                	<tr>
										<th >회의실</th>	                                
										<th>세미나실</th>	                                
										<th>다목적홀</th>	                                
										<th>작업실</th>	                                
                                	</tr>
                                	<tr>
										<th>파티룸</th>	                                
										<th>공연장</th>	                                
										<th>연습실</th>	                                
										<th>카페</th>	                                
                                	</tr>
                                	<tr>
										<th>스터디룸</th>	                                
										<th>엠티장소</th>	                                
										<th style="width:25%;">독립 오피스</th>	                                
										<th style="width:25%;">코워킹 스페이스</th>	                                
                                	</tr>
                                </table>
                               
                            </div>
                            <div class="pf-status">
                                <h4>가능시간<span class="text-danger">*</span></h4>
                                <div class="status-item">
	                                    <label for="ps-rent">월요일
	                                    	&emsp;
	                                    </label>
                                    <label for="ps-sale">화요일
                                        &emsp;
                                    </label>
                                    <label for="ps-sale">수요일
                                        &emsp;
                                    </label>
                                    <label for="ps-sale">목요일
                                        &emsp;
                                    </label>
                                    <label for="ps-sale">금요일
                                        &emsp;
                                    </label>
                                    <label for="ps-sale">토요일
                                        &emsp;
                                    </label>
                                    <label for="ps-sale">일요일
                                        &emsp;
                                    </label>
                                </div>
                            </div>
                            <div class="pf-feature-price">
                                <h4>공간 태그<span class="text-danger">*</span></h4>
                                <div class="row">
	                                <div class="ml-3 mb-3" style="width:31%">
	                                    <input id="tagName" type="text" placeholder="태그를 입력해주세요">
	                                </div>
	                                <div>
			                            <button id="addTags" type="button" class="btn btn-primary ml-4 p-10">추가 ⅴ</button>
		                            </div>
	                            </div>
		                        <span id="tags"></span>
                            </div>
                            <div class="pf-feature-price">
                                <h4>가격 (시간당)<span class="text-danger">*</span></h4>
                                <div class="fp-inputs">
                                    <input type="number" placeholder="가격을 입력해주세요">원
                                </div>
                            </div>
                            <div class="pf-feature">
                                <h4>옵션선택</h4>
                                <table class="table table-bordered" id="optionTb">
                                	<tr>
										<th style="width:25%;">TV/프로젝터</th>	                                
										<th style="width:25%;">인터넷/와이파이</th>	                                
										<th style="width:25%;">복사/인쇄기</th>	                                
										<th style="width:25%;">화이트보드</th>	                                
                                	</tr>
                                	<tr>
										<th>음향/마이크</th>	                                
										<th>취사시설</th>	                                
										<th>음식물반입가능</th>	                                
										<th>주류반입가능</th>	                                
                                	</tr>
                                	<tr>
										<th>샤워시설</th>	                                
										<th>주차</th>	                                
										<th>금연</th>	                                
										<th>반려동물 동반가능</th>	                                
                                	</tr>
                                	<tr>
										<th>PC/노트북</th>	                                
										<th>의자/테이블</th>	                                
										<th>내부화장실</th>	                                
										<th>탈의실</th>	                                
                                	</tr>
                                	<tr>
										<th>테라스/루프탑</th>	                                
										<th>공용라운지</th>	                                
										<th>전신거울</th>	                                
										<th>바베큐시설</th>	                                
                                	</tr>
                                </table>
                            </div>
                            <div class="pf-feature-image">
                                <h4>공간이미지<span class="text-danger">*</span></h4>
                                <div class="image-div">
	                                <div>
	                                	<i class="fas fa-plus"></i>
	                                </div>
	                            </div>
                                <div class="image-div">
	                                <div>
	                                	<i class="fas fa-plus"></i>
	                                </div>
	                            </div>
                                <div class="image-div">
	                                <div>
	                                	<i class="fas fa-plus"></i>
	                                </div>
	                            </div>
	                            <input type="file" name="" id="" />
	                            <input type="file" name="" id="" />
	                            <input type="file" name="" id="" />
                            </div>
                            <div class="pf-account" style="margin-bottom: 45px;">
	                            <div style="display:inline-block; width:40%">
	                                <h4>사업자등록증<span class="text-danger">*</span></h4>
	                                <input type="text"/>
	                            </div>
	                            <div style="display:inline-block; width:40%; margin-left: 14em;">
	                                <h4>계좌번호<span class="text-danger">*</span></h4>
	                                <input type="text"/>
	                            </div>
                            </div>
                            <div class="pf-property-details">
                            	<p>* 공간등록 심사는 2일 ~ 7일 소요됩니다.</p>
                                <button type="submit" class="site-btn">공간등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Property Submit Section End -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script>
//카테고리테이블 클릭이벤트
$("#categoryTb th").on("click", function(){
	if($("#categoryTb th").hasClass("bg-light")){
    	$("#categoryTb th").removeClass("bg-light");
    	$(this).addClass("bg-light");
	}else
    	$(this).addClass("bg-light");
});
//옵션테이블 클릭이벤트
$("#optionTb th").on("click", function(){
	if($(this).hasClass("bg-light"))
    	$(this).removeClass("bg-light");
	else
    	$(this).addClass("bg-light");
});
//태그 추가 클릭이벤트
$("#addTags").on('click', function(){
	if($("#tagName").val()==""){alert("내용을 입력해주세요");};
	if($("#tags span").length>=5){
		alert("최대 5개까지 입력 가능합니다");
	}
	else if($("#tagName").val()!=""){
    	$("#tags").append("<span class='label label-success m-2 p-2 small'>#"+$('#tagName').val()+"</span>"); 
    	$("#tagName").val("");
    }
});


</script>

<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>