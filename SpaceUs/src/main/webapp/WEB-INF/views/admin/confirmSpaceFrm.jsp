<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
.carousel {
    margin: 25px 0 50px;
    background: #fff;
    position: relative;
    padding: 8px;
    box-shadow: 0 0 1px rgba(0, 0, 0, 0.3);
}

.carousel:before,
.carousel:after {
    z-index: -1;
    position: absolute;
    content: "";
    bottom: 15px;
    left: 10px;
    width: 50%;
    top: 80%;
    max-width: 400px;
    background: rgba(0, 0, 0, 0.7);
    box-shadow: 0 15px 10px rgba(0, 0, 0, 0.7);
    transform: rotate(-3deg);
}

.carousel:after {
    transform: rotate(3deg);
    right: 10px;
    left: auto;
}

.carousel .carousel-item {
    text-align: center;
    min-height: 200px;
}

.carousel .carousel-item img {
    width: 100%;
    height: 500px;
    margin: 0 auto;
    /* Align slide image horizontally center in Bootstrap v3 */
}

.carousel-control-prev,
.carousel-control-next {
    width: 27px;
    height: 54px;
    overflow: hidden;
    opacity: 1;
    margin: auto 0;
    background: none;
    text-shadow: none;
}

.carousel-control-prev span,
.carousel-control-next span {
    width: 54px;
    height: 54px;
    display: inline-block;
    background: #4a4a4a;
    border-radius: 50%;
    box-shadow: 0 0 1px rgba(0, 0, 0, 0.3);
}

.carousel-control-prev span {
    margin-right: -27px;
}

.carousel-control-next span {
    margin-left: -27px;
}

.carousel-control-prev:hover span,
.carousel-control-next:hover span {
    background: #3b3b3b;
}

.carousel-control-prev i,
.carousel-control-next i {
    font-size: 24px;
    margin-top: 13px;
}

.carousel-control-prev {
    margin-left: -28px;
}

.carousel-control-next {
    margin-right: -28px;
}

.carousel-control-prev i {
    margin-left: -24px;
}

.carousel-control-next i {
    margin-right: -24px;
}

.carousel-indicators {
    bottom: -42px;
}

.carousel-indicators li,
.carousel-indicators li.active {
    width: 11px;
    height: 11px;
    border-radius: 50%;
    margin: 1px 4px;
}

.carousel-indicators li {
    border: 1px solid #475c6f;
}

.carousel-indicators li.active {
    background: #20b0b9;
    border-color: #20b0b9;
}
</style>
<!-- 컨텐츠 시작 -->
    <div class="hero-wrap ftco-degree-bg"
    	 style="background-image: url('${pageContext.request.contextPath }/resources/images/bg_1.jpg');
    	 		height: 400px"
    	 data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text text-center mx-auto" style="margin-bottom:50%;">
	            <h1 class="mb-4">공간 승인하기</h1>
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
                
                <div class="pf-title" style="margin-bottom: 20px;">
                    <h4>공간이름</h4>
                    <div class="mx-lg-5"><h5>공간이름입니다.</h5></div>
                </div>
                
                 <div class="pf-feature-price" style="margin-bottom: 20px;">
                     <h4>공간 호스트 이메일</h4>
                     <div class="mx-lg-5"><h5>공간 호스트 이메일입니다.</h5></div>
                 </div>
                 
                 <div class="pf-feature-price" style="margin-bottom: 20px;">
                     <h4>공간 호스트 사업자번호</h4>
                     <div class="mx-lg-5"><h5>공간 호스트 사업자번호입니다.</h5></div>
                 </div>
                 
                 <div class="pf-feature-price" style="margin-bottom: 20px;">
                     <h4>공간 등록일자</h4>
                     <div class="mx-lg-5"><h5>공간 등록일자입니다.</h5></div>
                 </div>
                
                <!-- 사진 시작 -->
                 <div class="container-sm" style="margin-bottom: 20px;">
                 		<h4>공간 사진<span class="text-danger">*</span></h4>
				        <div class="row">
				            <div class="col-md-8 mx-auto">
				                <div id="myCarousel" class="carousel slide" data-ride="carousel">
				                    <!-- Carousel indicators -->
				                    <ol class="carousel-indicators" >
				                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				                        <li data-target="#myCarousel" data-slide-to="1"></li>
				                        <li data-target="#myCarousel" data-slide-to="2"></li>
				                    </ol>
				                    <!-- Wrapper for carousel items -->
				                    <div class="carousel-inner" >
				                        <div class="carousel-item active">
				                            <img src="${pageContext.request.contextPath}/resources/images/about.jpg" class="img-fluid" alt="">
				                        </div>
				                        <div class="carousel-item">
				                            <img src="${pageContext.request.contextPath}/resources/images/bg_1.jpg" class="img-fluid" alt="">
				                        </div>
				                        <div class="carousel-item">
				                            <img src="${pageContext.request.contextPath}/resources/images/bg_2.jpg" class="img-fluid" alt="">
				                        </div>
				                    </div>
				                    <!-- Carousel controls -->
				                    <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
				                        <span><i class="fa fa-angle-left"></i></span>
				                    </a>
				                    <a class="carousel-control-next" href="#myCarousel" data-slide="next">
				                        <span><i class="fa fa-angle-right"></i></span>
				                    </a>
				                </div>
				            </div>
				        </div>
				    </div>
				    <!-- 사진 끝 -->
				    
                     <div class="pf-summernote" style="margin-bottom: 20px;">
                         <h4>공간설명</h4>
                         <div class="mx-lg-5">
                         	대통령은 필요하다고 인정할 때에는 외교·국방·통일 기타 국가안위에 관한 중요정책을 국민투표에 붙일 수 있다. 의원을 제명하려면 국회재적의원 3분의 2 이상의 찬성이 있어야 한다.
                         </div>
                     </div>
                    
                     <div class="pf-location" style="margin-bottom: 20px;">
                         <h4>공간주소</h4>
                         <div class="mx-lg-5">
                         	<h5>경기도 성남시 수정구 분당동 하나원스빌드 102-21</h5>
                         </div>
                     </div>
                     
                     <div class="pf-phone" style="margin-bottom: 20px;">
                         <h4>공간전화번호</h4>
                         <div class="mx-lg-5">
                         	<h5>010-1234-1234</h5>
                         </div>
                     </div>
                     
                     <div class="pf-type" style="margin-bottom: 20px;">
                         <h4>카테고리 선택</h4>
                         <span class="badge badge-warning badge-pill mx-lg-5" style="font-size: 15px;">다목적실</span>
                     </div>
                     
                
                     <div class="pf-feature-price" style="margin-bottom: 20px;">
                         <h4>공간 태그</h4>
                         <span class="badge badge-success badge-pill mx-lg-5" style="font-size: 15px;">#감각적인</span>
                     </div>
                     
                     <div class="pf-feature-price" style="margin-bottom: 20px;">
                         <h4>가격 (시간당)<span class="text-danger">*</span></h4>
                       	 <div class="mx-lg-5">
                         	<h5>50000원</h5>
                         </div>
                     </div>
                     
                     <div class="pf-feature" style="margin-bottom: 20px;">
                         <h4>옵션선택</h4>
                         <div class=" mx-lg-5">
	                         <span class="badge badge-primary badge-pill" style="font-size: 15px;">금연</span>
	                         <span class="badge badge-primary badge-pill" style="font-size: 15px;">인터넷/와이파이</span>
	                         <span class="badge badge-primary badge-pill" style="font-size: 15px;">샤워시설</span>
	                         <span class="badge badge-primary badge-pill" style="font-size: 15px;">주차</span>
                         </div>
                     </div> 
                     
                     <div class="pf-property-details" style="text-align: center;" >
                         <button type="submit" class="btn-info col-sm-3">공간 승인</button>
                         <button type="button" class="btn-secondary col-sm-3">공간 승인 취소</button>
                     </div>
                   </div>
               </div>
           </div>
       </div>
    </section>
    <!-- Property Submit Section End -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>


<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>